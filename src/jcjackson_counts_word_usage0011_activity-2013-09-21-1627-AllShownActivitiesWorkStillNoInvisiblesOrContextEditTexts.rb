#!/usr/bin/env ruby


# http://xkcd.com/378/

=begin
this file is jcjackson_counts_word_usage0011_activity.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-21-1627-AllShownActivitiesWorkStillNoInvisiblesOrContextEditTexts.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-20-1958.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-20-0033.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-19-1642-UNKNOWNFAIL.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-17-1741.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-17-1431.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-14-1403.rb
app is jcjackson_counts_word_usage-0.0.1.1
update rev is 0.0.1.1g 
=end

=begin
# includes from original example
require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :Button, :LinearLayout, :TextView, :EditText
=end

#=begin
require 'ruboto/activity'
require 'ruboto/widget'
require 'ruboto/util/stack'
require 'ruboto/util/toast'

require 'fileutils'

java_import "android.view.WindowManager"
java_import "android.view.Gravity"
java_import "android.view.KeyEvent"
java_import "android.view.MenuItem"
java_import "android.text.util.Linkify"
java_import "android.app.AlertDialog"
java_import "android.content.DialogInterface"
java_import "android.content.Context"
java_import "android.text.method.ScrollingMovementMethod"

ruboto_import_widgets :TabHost, :LinearLayout, :FrameLayout, :TabWidget,
  :Button, :EditText, :TextView, :ListView, :ScrollView

require 'stringio'
$main_binding = self.instance_eval{binding}
#=end

class JcjacksonCountsWordUsage0011Activity
  def onCreate(bundle)
    super
    set_title 'JC Jackson Counts Word Usage - 0.0.1.1f'

    btnCnt = Array.new(6,0)  #btnCnt = [0,0,0,0,0,0]
    @btnCnt = btnCnt
    btnStr = [" ","And-Um","F Word","Speaker drooled","Duhhh","Other curse"]
    @btnStr = btnStr
    
    # @menuChoiceEntry = "init"

    displayString = "init";
    displayStr = [ btnStr[0],btnStr[1],btnStr[2],btnStr[3],btnStr[4],btnStr[5] ] 
    @displayStr = displayStr

    textViewTail = "initial text view tail"
    @textViewTail = textViewTail

    displayString = makeDisplayString(1, btnStr, btnCnt, textViewTail) 
    @displayString = displayString
                                                          #  :visibility => "INVISIBLE",  # :layout_below => 42,

    self.content_view = linear_layout :orientation => :vertical do

          @text_view = text_view :text => "very strange", :id => 42, :width => :match_parent,
                                 :gravity => :center, :text_size => 24.0
          button :text => btnStr[1], :width => :match_parent, :id => 43,#:visible => android.setVisibility(0),# :visibility => :invisible,           
                                     :on_click_listener => proc { btnCnt[1] = buttonAUpcount(1, btnStr, btnCnt) }
          button :text => btnStr[2], :width => :match_parent, :id => 44, 
                                     :on_click_listener => proc { btnCnt[2] = buttonAUpcount(2, btnStr, btnCnt) }
          button :text => btnStr[3], :width => :match_parent, :id => 45, 
                                     :on_click_listener => proc { btnCnt[3] = buttonAUpcount(3, btnStr, btnCnt) }
          button :text => btnStr[4], :width => :match_parent, :id => 46, 
                                     :on_click_listener => proc { btnCnt[4] = buttonAUpcount(4, btnStr, btnCnt) }
          button :text => btnStr[5], :width => :match_parent, :id => 47, 
                                     :on_click_listener => proc { btnCnt[5] = buttonAUpcount(5, btnStr, btnCnt) }
          
          # @quantity
          @menuChoiceEntry = edit_text :hint => "Enter Text", :id => 48,                   # :text => "word", 
                                       :width => :match_parent, :gravity => :center, :text_size => 24.0
                                       # :input_type => android.text.InputType::TYPE_CLASS_TEXT
                                       # @menuChoiceEntry = edit_text :hint => "Enter quantity", :width => :match_parent, :id => 48, :lines => 1   
                                       # :text => "85"    # :single_line => true   # , :lines => 1
                                       # et = edit_text(:hint => "Line number", :input_type => android.text.InputType::TYPE_CLASS_NUMBER)
                                       # @edit_name = edit_text :text => "untitled.rb"
                                       # @irb_edit = edit_text(:lines => 1, :on_key_listener => (proc{|v,kc,e| my_key_listener(v,kc,e)}))
          
          

             
          
          button :text => "enter number", :width => :match_parent, :id => 49 , 
                                     :on_click_listener => proc { @text_view.text = makeDisplayString( 1, btnStr, 
                                                                  btnCnt, ( @textViewTail = @menuChoiceEntry.text.to_s)) }
                                               # @textViewTail = @menuChoiceEntry.text.to_s
                                               # proc { edTxtEntryToDisplayString(btnLn, btnStr, btnCnt, textViewTail) }
                                                                     # makeDisplayString(@btnLn, @btnStr, @btnCnt, @menuChoiceEntry.text.to_s) }
                                       # proc { @textViewTail = @menuChoiceEntry.text.to_s }  
                                       # @text_view.text = "3579"  #  @handle_click  #  makeDisplayString(btnLn, btnStr, btnCnt)
          @btnCnt = btnCnt
          @btnStr = btnStr
          @text_view.text = makeDisplayString(@btnLn, @btnStr, @btnCnt, textViewTail)
          

    end

    registerForContextMenu(findViewById(43))
    registerForContextMenu(findViewById(44))
    registerForContextMenu(findViewById(45))
    registerForContextMenu(findViewById(46))
    registerForContextMenu(findViewById(47))

    registerForContextMenu(findViewById(49))

  rescue
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end


  def my_key_listener(view, key_code, event)   #not presently used
    rv = false
    if [KeyEvent::ACTION_DOWN, KeyEvent::ACTION_MULTIPLE].include? event.getAction
      if (@cursor > 0 and key_code == KeyEvent::KEYCODE_DPAD_UP) or
         (@cursor < (@history.size - 1) and key_code == KeyEvent::KEYCODE_DPAD_DOWN)
        @history[@cursor] = @irb_edit.getText.toString if @cursor == (@history.size - 1)
        @cursor += (key_code == KeyEvent::KEYCODE_DPAD_UP) ? -1 : 1
        @irb_edit.setText @history[@cursor]
        rv = true
      end
    elsif key_code == KeyEvent::KEYCODE_ENTER
      line = @irb_edit.getText.toString
      line["\n"] = ""
      unless line == ""
        @history[-1] = line
        @history << ""
        @cursor = @history.size - 1
        @irb_edit.setText ""
        execute line
      end
      rv = true
    end
    rv
  end


  def onCreateContextMenu(menu, v, menuInfo)
    super
    # menu.header_title = 'Context Menu' # temporarily commented as it causes no method errors in some installations

    menu.add(0, v.id, 0, "ContextAction-1 " + v.id.to_s).setOnMenuItemClickListener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      aString = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      @text_view.text = aString.to_s
      true # Prevent other listeners from executing.
    end

    menu.add(0, v.id, 0, 'ContextAction-2 ' + v.id.to_s).setOnMenuItemClickListener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      
      # @menuChoiceEntry = edit_text :hint => "Enter Text", :id => 48,                   # :text => "word", 
      #                                 :width => :match_parent, :gravity => :center, :text_size => 24.0


      @textViewTail = menu_item.title.to_s
      aString = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      @text_view.text = aString.to_s
      true # Prevent other listeners from executing.
    end

    menu.add(0, v.id, 0, 'ContextAction-3 ' + v.id.to_s).setOnMenuItemClickListener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      aString = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      @text_view.text = aString.to_s
      true # Prevent other listeners from executing.
    end
  end

#  def on_create_context_menu(menu, view, menu_info)
#    mi = menu.add("Edit")
#    mi = menu.add("Execute")
#    mi = menu.add("Delete")
#
#    true
#  end

  def on_context_item_selected(mi)   # not yet used
    pos = mi.menu_info.position

    case mi.title.to_s
    when "Edit"
      edit @scripts_list[pos]
    when "Execute"
      begin
        execute IO.read(@scripts_list[pos]), "[Running #{@scripts_list[pos]}]"
      rescue
        toast "#{@scripts_list[pos]} not found!"
      end
    when "Delete"
      @confirm_delete = @scripts_list[pos]
      AlertDialog::Builder.new(@ruboto_java_instance).
              setMessage("Delete #{@confirm_delete}?").
              setCancelable(false).
              setPositiveButton("Yes", (proc{|d,w| my_dialog_click(d,w)})).
              setNegativeButton("No", (proc{|d,w| my_dialog_click(d,w)})).
              create.
              show
    end

    true
  end

  def onCreateOptionsMenu(menu)
    menu.add('OptionsAction-1').set_on_menu_item_click_listener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      @text_view.text = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      true # Prevent other listeners from executing.
    end

    mi = menu.add('OptionsAction-2')
    mi.set_icon $package.R::drawable::get_ruboto_core
    mi.set_on_menu_item_click_listener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      @text_view.text = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      true # Prevent other listeners from executing.
    end
    true # Display the menu.
  end

  private

  def edTxtEntryToDisplayString(btnLn, btnStr, btnCnt, textViewTail)
     
    return stuff 
  end

  def makeDisplayString(btttnLn, btttnStr, btttnCnt, textViewTail)
    #  displaySttring = "fake"
    displaySttring = btttnStr[1] + " = " + btttnCnt[1].to_s + ", " + btttnStr[2] + " = " + btttnCnt[2].to_s + ", " + 
                     btttnStr[3] + " = " + btttnCnt[3].to_s + ", " + btttnStr[4] + " = " + btttnCnt[4].to_s + ", " + 
                     btttnStr[5] + " = " + btttnCnt[5].to_s + ", " + textViewTail.to_s
    return displaySttring
    #  return "SSSSS" 
  end

  def buttonAUpcount(bttnLn, bttnStr, bttnCnt)
    aString = "hhh"
    bttnCnt[bttnLn] = bttnCnt[bttnLn] + 1
    # btnCnt[1] = btnCnt.at(1) + 1
    # proc { makeDisplayString }
    aString = makeDisplayString(bttnLn, bttnStr, bttnCnt, @textViewTail) 
    #  aString = "displayString" + bttnCnt[bttnLn].to_s + " !"  
    @text_view.text = aString
    aString = "Button line " + bttnLn.to_s + ", count = " + bttnCnt[bttnLn].to_s
    toast aString
    return bttnCnt[bttnLn]
  end

end


class SubMenus            # RubotoPt8MakeuiExampleActivity
  def on_create(bundle)
    # super
    # Create a proc to act as the buttons's click listener
    handle_click = proc do |view|
      @tv.append "\n#{view.getText}"
      @et.text = view.getText
      destroy  #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,,
    end
    setContentView(
      linear_layout(:orientation => :vertical) do
        @et = edit_text
        linear_layout do
          button :text => "Hello, World", :on_click_listener => handle_click
          button :text => "Hello, Ruboto", :on_click_listener => handle_click
        end
        @tv = text_view :text => "Click buttons or menu items:"
      end
    )
  end
end

