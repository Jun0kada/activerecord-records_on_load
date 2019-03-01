module ActiveRecord
  module RecordsOnLoad
    def load(&block)
      super(&block)

      if @_on_load_blocks.present?
        @_on_load_blocks.each { |b| b.call(@records) }
      end

      self
    end

    def on_load(&block)
      @_on_load_blocks ||= []
      @_on_load_blocks << block
      self
    end
  end
end
