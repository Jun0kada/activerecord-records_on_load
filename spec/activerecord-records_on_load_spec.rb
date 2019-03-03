require 'spec_helper'

describe ActiveRecord::RecordsOnLoad do
  before do
    @hooked_count = 0
  end

  context 'when AR loaded' do
    it 'should be hooked on_load' do
      expect {
        User.all.on_load {
          @hooked_count += 1
        }.load
      }.to change { @hooked_count }.from(0).to(1)
    end

    it 'should be hooked multi on_load' do
      expect {
        User.all.on_load {
          @hooked_count += 1
        }.on_load {
          @hooked_count += 1
        }.load
      }.to change { @hooked_count }.from(0).to(2)
    end

    it 'should be hooked multi on_load with method chain' do
      expect {
        User.all.on_load {
          @hooked_count += 1
        }.on_load {
          @hooked_count += 1
        }.limit(1).load
      }.to change { @hooked_count }.from(0).to(2)
    end
  end

  context 'when AR not load' do
    it 'should be not hooked on_load' do
      expect {
        User.all.on_load {
          @hooked_count += 1
        }.on_load {
          @hooked_count += 1
        }
      }.not_to change { @hooked_count }
    end
  end

  context 'without on_load' do
    it 'should be normal' do
      expect { User.all }.not_to raise_error
    end
  end
end
