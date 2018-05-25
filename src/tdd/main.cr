module Tdd
  class Main
    def initialize(@in_array : Array(Int32))
    end

    def call : Array(Int32)
      @in_array.select do |i|
        i < 5
      end
    end
  end
end
