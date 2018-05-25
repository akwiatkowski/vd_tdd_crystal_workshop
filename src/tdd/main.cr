module Tdd
  alias InOutObject = (Array(Int32) | Int32)

  class Main
    getter :in_object

    def initialize(@in_object : InOutObject)
    end

    def less_than_5
      if in_object.as?(Array)
        in_object.as(Array(Int32)).select do |i|
          check_object(i)
        end
      else
        i = in_object.as(Int32)
        if check_object(i)
          i
        else
          nil
        end
      end

    end

    private def check_object(i)
      i < 5
    end
  end
end
