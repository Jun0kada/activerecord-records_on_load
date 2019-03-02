module ActiveRecord
  module RecordsOnLoad
    def load(&block)
      super(&block)

      if @_on_load_blocks.present?
        @_on_load_blocks.each do |b|
          b.call(@records)
        end
      end

      self
    end

    def on_load(&block)
      @_on_load_blocks ||= []
      @_on_load_blocks << block
      clone
    end
  end
end
