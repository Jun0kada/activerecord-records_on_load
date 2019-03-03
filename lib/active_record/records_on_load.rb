module ActiveRecord
  module RecordsOnLoad
    def load(&block)
      super(&block)

      on_load_block_values.each do |block|
        block.call(@records)
      end

      self
    end

    def on_load(&block)
      raise ArgumentError, 'The method .on_load() must contain block argument.' unless block
      spawn.on_load!(&block)
    end

    def on_load!(&block)
      self.on_load_block_values += [block]
      self
    end

    def on_load_block_values
      @on_load_block_values || []
    end

    def on_load_block_values=(value)
      @on_load_block_values = value
    end
  end
end
