#!/usr/bin/env ruby


# http://xkcd.com/378/

=begin
this file is jcjackson_counts_word_usage0011_activity.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-30-2121-AllWorksRudimentaryAddingReadersFromTutsSplashFailed.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-27-1833-AllWorksRudimentaryBeginingAddingSplashaAndReadersFromTuts.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-24-0115-AllWorksRudimentaryAddedChgOfCntStillNeedsInvisibleEtAl.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-23-0243-AllWorksRudimentaryNowNeedsInvisibleEtAl.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-22-2300-AllWorksWithNewElemArrOnWayToBtnChanger.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-21-1627-AllShownActivitiesWorkStillNoInvisiblesOrContextEditTexts.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-20-1958.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-20-0033.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-19-1642-UNKNOWNFAIL.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-17-1741.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-17-1431.rb
last backup save was jcjackson_counts_word_usage0011_activity-2013-09-14-1403.rb
app is jcjackson_counts_word_usage-0.0.1.1
update rev is 0.0.1.1n 
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


# https://groups.google.com/forum/#!topic/ruboto/X1aqOectnnM
#  import 'android.widget.ArrayAdapter' // just import the java classes here
# > .....
# > adapter = ArrayAdapter.new(self, Ruboto::R::layout::simplerow)  // And you can do it just like before!
# > .....



ruboto_import_widgets :TabHost, :LinearLayout, :FrameLayout, :TabWidget,
  :Button, :EditText, :TextView, :ListView, :ScrollView, :RelativeLayout 

require 'stringio'
$main_binding = self.instance_eval{binding}
#=end

class JcjacksonCountsWordUsage0011Activity
  def onCreate(bundle)
    super
    # set_title 'JC Jackson Counts Word Usage - 0.0.1.1'
    softwareTitleString = 'JC Jackson Counts Word Usage - 0.0.1.1n'
    set_title softwareTitleString
    # SOFTWARE_SOURCE_FILE = "jcjackson_counts_word_usage0011_activity.rb"
    softWareSourceFileNameString = "jcjackson_counts_word_usage0011_activity.rb"


    scrnActnElem = Array.new(10,0)
    @scrnActnElem = scrnActnElem

    btnCnt = Array.new(10,0)  #btnCnt = [0,0,0,0,0,0]
    @btnCnt = btnCnt
    btnStr = [" "," "," ","And-Um","F Word","Speaker drooled","Duhhh","Other curse", "Wrinkled", "Hungover"]
    @btnStr = btnStr
    
    # @menuChoiceEntry = "init"

    displayString = "init";
    displayStr = [ btnStr[0],btnStr[1],btnStr[2],btnStr[3],btnStr[4],btnStr[5],btnStr[6],btnStr[7],btnStr[8],btnStr[9] ] 
    @displayStr = displayStr

    textViewTail = "initial text view tail"
    @textViewTail = textViewTail

    displayString = makeDisplayString(1, btnStr, btnCnt, textViewTail) 
    @displayString = displayString
                                                          #  :visibility => "INVISIBLE",  # :layout_below => 42, 

    @firstBtnCntElem = 3 ; @lastBtnCntElem = 7 ;


    @mainScreen = self.content_view = linear_layout :orientation => :vertical do

          @text_view = text_view :text => "very strange", :id => 2, :width => :match_parent,
                                 :gravity => :center, :text_size => 24.0
          @scrnActnElem[3] = button :text => btnStr[3], :width => :match_parent, :id => 3,           
                                     :on_click_listener => proc { btnCnt[3] = buttonAUpcount(3, btnStr, btnCnt) } 
                                     #:visible => android.setVisibility(0),# :visibility => :invisible,
          @scrnActnElem[4] = button :text => btnStr[4], :width => :match_parent, :id => 4, 
                                     :on_click_listener => proc { btnCnt[4] = buttonAUpcount(4, btnStr, btnCnt) }
          @scrnActnElem[5] = button :text => btnStr[5], :width => :match_parent, :id => 5, 
                                     :on_click_listener => proc { btnCnt[5] = buttonAUpcount(5, btnStr, btnCnt) }
          @scrnActnElem[6] = button :text => btnStr[6], :width => :match_parent, :id => 6, 
                                     :on_click_listener => proc { btnCnt[6] = buttonAUpcount(6, btnStr, btnCnt) }
          @scrnActnElem[7] = button :text => btnStr[7], :width => :match_parent, :id => 7, 
                                     :on_click_listener => proc { btnCnt[7] = buttonAUpcount(7, btnStr, btnCnt) }
          
          # @quantity
          @menuChoiceEntry = edit_text :hint => "Enter Text", :id => 8,                    
                                       :width => :match_parent, :gravity => :center, :text_size => 24.0 
                                       # :text => "word",
                                       # :input_type => android.text.InputType::TYPE_CLASS_TEXT
                                       # @menuChoiceEntry = edit_text :hint => "Enter quantity", :width => :match_parent, :id => 48, :lines => 1   
                                       # :text => "85"    # :single_line => true   # , :lines => 1
                                       # et = edit_text(:hint => "Line number", :input_type => android.text.InputType::TYPE_CLASS_NUMBER)
                                       # @edit_name = edit_text :text => "untitled.rb"
                                       # @irb_edit = edit_text(:lines => 1, :on_key_listener => (proc{|v,kc,e| my_key_listener(v,kc,e)}))
          
          button :text => "enter number", :width => :match_parent, :id => 9 , 
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

    registerForContextMenu(findViewById(3))
    registerForContextMenu(findViewById(4))
    registerForContextMenu(findViewById(5))
    registerForContextMenu(findViewById(6))
    registerForContextMenu(findViewById(7))

    registerForContextMenu(findViewById(9))

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
    # menu.text_size = 12.0  # causes crashes

    menu.add(0, v.id, 0, "Move this key up one." ).setOnMenuItemClickListener do |menu_item| 
      # "ContextAction-1, id=" + v.id.to_s
      # @text_view.text = menu_item.title
      # toast menu_item.title

      # @firstBtnCntElem = 3 ; @lastBtnCntElem = 7 ; # @scrnActnElem[7]

      #  scrnActnElemHOLDER = button :text => "scrnActnElemHOLDER"   # , :width => :match_parent, :id => 3,           
                                     # :on_click_listener => proc { btnCnt[3] = buttonAUpcount(3, btnStr, btnCnt) } 
                                     #:visible => android.setVisibility(0),# :visibility => :invisible,

      if v.id <= @firstBtnCntElem 
=begin
        scrnActnElemHOLDER = @scrnActnElem(@lastBtnCntElem)
        @scrnActnElem(@lastBtnCntElem) = @scrnActnElem(@firstBtnCntElem)
        @scrnActnElem(@firstBtnCntElem) = scrnActnElemHOLDER 
=end
=begin
        scrnActnElemHOLDER = @scrnActnElem(@lastBtnCntElem).text.to_s
        @scrnActnElem(@lastBtnCntElem).text = @scrnActnElem(@firstBtnCntElem).text.to_s
        @scrnActnElem(@firstBtnCntElem).text = scrnActnElemHOLDER 
=end

        scrnActnElemHOLDER = findViewById( @firstBtnCntElem ).text
        btnStrHOLDER       = @btnStr[ @firstBtnCntElem ] 
        btnCntHOLDER       = @btnCnt[ @firstBtnCntElem ] 

# =begin
        for marker in ( @firstBtnCntElem + 1 ) .. ( @lastBtnCntElem - 1 )
          # scrnActnElemHOLDER = findViewById( marker ).text 
          # btnStrHOLDER       = @btnStr[ v.id.to_i - 1 ]
          # btnCntHOLDER       = @btnCnt[ v.id.to_i - 1 ].to_i
          findViewById( marker - 1).text = findViewById( marker ).text
          @btnStr[ marker - 1 ]          = @btnStr[ marker ]
          @btnCnt[ marker - 1 ]          = @btnCnt[ marker ]
          # findViewById( marker ).text = scrnActnElemHOLDER 
          # @btnStr[ marker ]           = btnStrHOLDER
          # @btnCnt[ marker ]           = btnCntHOLDER
        end
# =end

        # findViewById( @firstBtnCntElem ).text = findViewById( @lastBtnCntElem ).text 
        # @btnStr[ @firstBtnCntElem ]           = @btnStr[ @lastBtnCntElem ]
        # @btnCnt[ @firstBtnCntElem ]           = @btnCnt[ @lastBtnCntElem ]

        findViewById( @lastBtnCntElem -1 ).text = scrnActnElemHOLDER 
        @btnStr[ @lastBtnCntElem - 1 ]           = btnStrHOLDER
        @btnCnt[ @lastBtnCntElem - 1 ]           = btnCntHOLDER


      else

=begin
        scrnActnElemHOLDER = @scrnActnElem(v.id - 1)
        @scrnActnElem(v.id - 1) = @scrnActnElem(v.id)
        @scrnActnElem(v.id) = scrnActnElemHOLDER 
=end
=begin
        scrnActnElemHOLDER = @scrnActnElem(v.id - 1).text.to_s
        @scrnActnElem(v.id - 1).text = @scrnActnElem(v.id).text.to_s
        @scrnActnElem(v.id).text = scrnActnElemHOLDER 
=end
        # scrnActnElemHOLDER.text = @scrnActnElem(v.id - 1).text.to_s 
        # scrnActnElemText = @scrnActnElem(v.id - 1)
        # @mainScreen.reload(self)
        #  findViewById(v.id.to_i).text = @menuChoiceEntry.text  #'NOW IS THIS BUTTON CHANGING THE BUTTON?'
        #  @btnStr[v.id.to_i] = @menuChoiceEntry.text.to_s  # v.id.to_i

        scrnActnElemHOLDER = findViewById(v.id.to_i - 1).text
        btnStrHOLDER       = @btnStr[ v.id.to_i - 1 ]
        btnCntHOLDER       = @btnCnt[ v.id.to_i - 1 ].to_i
        findViewById(v.id.to_i - 1).text = findViewById(v.id.to_i).text
        @btnStr[ v.id.to_i - 1 ]         = @btnStr[ v.id.to_i ]
        @btnCnt[ v.id.to_i - 1 ]         = @btnCnt[ v.id.to_i ]
        findViewById(v.id.to_i).text = scrnActnElemHOLDER 
        @btnStr[ v.id.to_i ]         = btnStrHOLDER
        @btnCnt[ v.id.to_i ]         = btnCntHOLDER

      end
      toast "Exchanged a key up one?"
      @textViewTail = menu_item.title.to_s
      aString = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      @text_view.text = aString.to_s
      true # Prevent other listeners from executing.
    end

    menu.add(0, v.id, 0, "Change word tracked to that already in EditText." ).setOnMenuItemClickListener do |menu_item| 
      # '@menuChoiceEntry.text, id=' + v.id.to_s
      # @text_view.text = menu_item.title
      # toast menu_item.title
      
      # @menuChoiceEntry = edit_text :hint => "Enter Text", :id => 48,                   # :text => "word", 
      #                                 :width => :match_parent, :gravity => :center, :text_size => 24.0

      if @btnCnt[v.id.to_i] == 0
        
        if @menuChoiceEntry.text.length > 0
          findViewById(v.id.to_i).text = @menuChoiceEntry.text  #'NOW IS THIS BUTTON CHANGING THE BUTTON?'
          @btnStr[v.id.to_i] = @menuChoiceEntry.text.to_s  # v.id.to_i
        else
          toast "No text in EditText."
        end

      else
        toast "No button change allowed, count is non zero."
      end

      @textViewTail = menu_item.title.to_s 
      aString = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      @text_view.text = aString.to_s
      true # Prevent other listeners from executing.
    end

    menu.add(0, v.id, 0, "Set count to number already in EditText." ).setOnMenuItemClickListener do |menu_item|
      # 'ContextAction-3, id=' + v.id.to_s
      # @text_view.text = menu_item.title
      # toast menu_item.title


      if @menuChoiceEntry.text.length > 0
          # @btnCnt[v.id.to_i] == 0
        anInteger = @menuChoiceEntry.text.to_s.to_i
        # anInteger = anInteger.to_i
        if  ( @menuChoiceEntry.text.to_s.to_i != 0 ) && ( @menuChoiceEntry.text.length >= 1 ) 
          # findViewById(v.id.to_i).text = @menuChoiceEntry.text  #'NOW IS THIS BUTTON CHANGING THE BUTTON?'
          @btnCnt[v.id.to_i] = @menuChoiceEntry.text.to_s.to_i  # v.id.to_i
        elsif  ( @menuChoiceEntry.text.to_s == "0" ) && ( @menuChoiceEntry.text.length == 1 )  
          # findViewById(v.id.to_i).text = @menuChoiceEntry.text  #'NOW IS THIS BUTTON CHANGING THE BUTTON?'
          @btnCnt[v.id.to_i] = @menuChoiceEntry.text.to_s.to_i  # v.id.to_i
        elsif  ( @menuChoiceEntry.text.to_s.to_i == 0 ) && ( (@menuChoiceEntry.text.to_s.count("0")) > 0 ) && 
               ( @menuChoiceEntry.text.length >= 1 ) 
          # findViewById(v.id.to_i).text = @menuChoiceEntry.text  #'NOW IS THIS BUTTON CHANGING THE BUTTON?'
          @btnCnt[v.id.to_i] = @menuChoiceEntry.text.to_s.to_i  # v.id.to_i
        else
          toast "No number in EditText."
        end

      else
        toast "No entry in EditText."
      end


      @textViewTail = menu_item.title.to_s
      aString = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      @text_view.text = aString.to_s
      true # Prevent other listeners from executing.
    end

    menu.add(0, v.id, 0, "Make Key Invisible." ).setOnMenuItemClickListener do |menu_item|
      # 'ContextAction-3, id=' + v.id.to_s
      # @text_view.text = menu_item.title
      # toast menu_item.title
      
        # btn=(Button)findViewById(R.id.btn); btn.setVisibility(View.INVISIBLE)
        # findViewById( v.id.to_i ).setVisibility(View.INVISIBLE)      #.text = findViewById( marker ).text

      toast "Making key invisible?"
      @textViewTail = menu_item.title.to_s
      aString = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      @text_view.text = aString.to_s
      true # Prevent other listeners from executing.
    end

    menu.add(0, v.id, 0, "Go Back and Ignore." ).setOnMenuItemClickListener do |menu_item|
      # 'ContextAction-3, id=' + v.id.to_s
      # @text_view.text = menu_item.title
      # toast menu_item.title

      toast "Ignoring and Going Back."
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
 
=begin
    menu.add('OptionsAction-1').set_on_menu_item_click_listener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      @text_view.text = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      true # Prevent other listeners from executing.
    end
=end

    menuOptionsHelp = menu.add('Help.')
    # menuOptionsAboutAideLearning.set_icon $package.R::drawable::get_ruboto_core
    menuOptionsHelp.set_on_menu_item_click_listener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      @text_view.text = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      true # Prevent other listeners from executing.
    end

    menuOptionsZeroWordCounts = menu.add('Zero All Word Counts.')
    # menuOptionsAboutAideLearning.set_icon $package.R::drawable::get_ruboto_core
    menuOptionsZeroWordCounts.set_on_menu_item_click_listener do |menu_item|

        for marker in ( @firstBtnCntElem ) .. ( @lastBtnCntElem )
          # scrnActnElemHOLDER = findViewById( marker ).text 
          # btnStrHOLDER       = @btnStr[ v.id.to_i - 1 ]
          # btnCntHOLDER       = @btnCnt[ v.id.to_i - 1 ].to_i
          # findViewById( marker - 1).text = findViewById( marker ).text
          # @btnStr[ marker - 1 ]          = @btnStr[ marker ]
          @btnCnt[ marker ] = 0
          # findViewById( marker ).text = scrnActnElemHOLDER 
          # @btnStr[ marker ]           = btnStrHOLDER
          # @btnCnt[ marker ]           = btnCntHOLDER
        end

      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      @text_view.text = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      true # Prevent other listeners from executing.
    end

    menuOptionsSettingsPrefs = menu.add('Settings and Preferences.')
    # menuOptionsAboutAideLearning.set_icon $package.R::drawable::get_ruboto_core
    menuOptionsSettingsPrefs.set_on_menu_item_click_listener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      @text_view.text = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      true # Prevent other listeners from executing.
    end

    menuOptionsAboutAideLearning = menu.add('About AideLearning.')
    # menuOptionsAboutAideLearning.set_icon $package.R::drawable::get_ruboto_core
    menuOptionsAboutAideLearning.set_on_menu_item_click_listener do |menu_item|
      # @text_view.text = menu_item.title
      # toast menu_item.title
      @textViewTail = menu_item.title.to_s
      @text_view.text = makeDisplayString(@btnLn, @btnStr, @btnCnt, @textViewTail)
      true # Prevent other listeners from executing.
    end

    menuOptionsAboutRuboto = menu.add('About Ruboto.')
    menuOptionsAboutRuboto.set_icon $package.R::drawable::get_ruboto_core
    menuOptionsAboutRuboto.set_on_menu_item_click_listener do |menu_item|
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
    displaySttring = btttnStr[3] + " = " + btttnCnt[3].to_s + ", " + btttnStr[4] + " = " + btttnCnt[4].to_s + ", " + 
                     btttnStr[5] + " = " + btttnCnt[5].to_s + ", " + btttnStr[6] + " = " + btttnCnt[6].to_s + ", " + 
                     btttnStr[7] + " = " + btttnCnt[7].to_s + ", " + textViewTail.to_s
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

