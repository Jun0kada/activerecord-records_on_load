module ActiveRecord
  module RecordsOnLoad
    def load(&block)
      super(&block)
      @_on_load_block.call(@records) if @_on_load_block
      self
    end

    def on_load(&block)
      @_on_load_block = block
      self
    end
  end
end
