require 'spec_helper'

describe 'ActiveRecord::Relation#on_load' do
  context 'when loaded records' do
    it 'should hooked on_load' do
      hooked = false
      User.all.on_load { hooked = true }.load
      expect(hooked).to eq(true)
    end
  end

  context 'when not loaded records' do
    it 'should not hooked on_load' do
      hooked = false
      User.all.on_load { hooked = true }
      expect(hooked).to eq(false)
    end
  end

  context 'without on_load' do
    it 'should be normal' do
      expect(User.all.to_sql).to eq("SELECT \"users\".* FROM \"users\"")
    end
  end
end
