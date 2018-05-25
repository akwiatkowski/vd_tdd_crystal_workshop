module Tdd
  alias InOutObject = (Array(Int32) | Int32 | Nil)

  class Main
    getter :in_object

    def initialize(@in_object : InOutObject)
    end

    def validify(valid_proc)
      self.class.new(
        in_object: valid_by(valid_proc)
      )
    end

    def less_than_5
      valid_by(
        valid_proc: ->(i : Int32) { i < 5 }
      )
    end

    def more_than_5
      valid_by(
        valid_proc: ->(i : Int32) { i > 5 }
      )
    end

    def parity
      valid_by(
        valid_proc: ->(i : Int32) { i.even? }
      )
    end

    private def valid_by(valid_proc)
      if in_object.as?(Array)
        in_object.as(Array(Int32)).select do |i|
          valid_proc.call(i)
        end
      else
        i = in_object.as(Int32)
        if valid_proc.call(i)
          i
        else
          nil
        end
      end
    end
  end
end
