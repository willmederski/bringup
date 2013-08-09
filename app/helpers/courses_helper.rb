module CoursesHelper

 def stroke_axis(options={})
       options = { :height => 500,
                   :width => 500
                 }.merge(options)
      
       dash(1, :space => 4)
       stroke_horizontal_line(-21, options[:width], :at => 0)
       stroke_vertical_line(-21, options[:height], :at => 0)
  end   

 

end
