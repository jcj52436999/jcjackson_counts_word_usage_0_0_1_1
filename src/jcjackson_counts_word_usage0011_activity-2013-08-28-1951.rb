require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :Button, :LinearLayout, :TextView

# http://xkcd.com/378/

# this file is jcjackson_counts_word_usage0011_activity.rb
# app is jcjackson_counts_word_usage-0.0.1.1
# update rev is 0.0.1.1

class JcjacksonCountsWordUsage0011Activity
  def onCreate(bundle)
    super
    set_title 'JC Jackson Counts Word Usage - 0.0.1.1'

    btnCnt = Array.new(6,0)  #btnCnt = [0,0,0,0,0,0]
    btnStr = [" ","And-Um","F Word","Speaker drooled","Duhhh","Other curse"]

    #  btnCnt[1] = 1

    displayString = "init";

    displayStr = [ btnStr[0],btnStr[1],btnStr[2],btnStr[3],btnStr[4],btnStr[5] ] 

    self.content_view =
        linear_layout :orientation => :vertical do
          @text_view = text_view :text => 'All counts zero.', :id => 42, :width => :match_parent,
                                 :gravity => :center, :text_size => 24.0
          button :text => btnStr[1], :width => :match_parent, :id => 43, :on_click_listener => proc { btnCnt[1] = buttonAUpcount(1, btnStr, btnCnt) }
          button :text => btnStr[2], :width => :match_parent, :id => 44, :on_click_listener => proc { btnCnt[2] = buttonAUpcount(2, btnStr, btnCnt) }
          button :text => btnStr[3], :width => :match_parent, :id => 45, :on_click_listener => proc { btnCnt[3] = buttonAUpcount(3, btnStr, btnCnt) }
          button :text => btnStr[4], :width => :match_parent, :id => 46, :on_click_listener => proc { btnCnt[4] = buttonAUpcount(4, btnStr, btnCnt) }
          button :text => btnStr[5], :width => :match_parent, :id => 47, :on_click_listener => proc { btnCnt[5] = buttonAUpcount(5, btnStr, btnCnt) }

        end
  rescue
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  private

  def makeDisplayString(btttnLn, btttnStr, btttnCnt)
    #  displaySttring = "fake"
    displaySttring = btttnStr[1] + " = " + btttnCnt[1].to_s + ", " + btttnStr[2] + " = " + btttnCnt[2].to_s + ", " + btttnStr[3] + " = " + btttnCnt[3].to_s + ", " + btttnStr[4] + " = " + btttnCnt[4].to_s + ", " + btttnStr[5] + " = " + btttnCnt[5].to_s
    return displaySttring
    #  return "SSSSS" 
  end

  def buttonAUpcount(bttnLn, bttnStr, bttnCnt)
    aString = "hhh"
    bttnCnt[bttnLn] = bttnCnt[bttnLn] + 1
    # btnCnt[1] = btnCnt.at(1) + 1
    # proc { makeDisplayString }
    aString = makeDisplayString(bttnLn, bttnStr, bttnCnt) 
    #  aString = "displayString" + bttnCnt[bttnLn].to_s + " !"  
    @text_view.text = aString
    aString = "Button line " + bttnLn.to_s + ", count = " + bttnCnt[bttnLn].to_s
    toast aString
    return bttnCnt[bttnLn]
  end

end

