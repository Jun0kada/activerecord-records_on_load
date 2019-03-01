require 'spec_helper'

describe 'ActiveRecord::Relation#on_load' do
  context 'when loaded records' do
    it 'should hooked on_load' do
      hooked_count = 0
      User.all.on_load { hooked_count += 1 }.load
      expect(hooked_count).to eq(1)
    end

    it 'should hooked multi on_load' do
      hooked_count = 0
      User.all.on_load {
        hooked_count += 1
      }.on_load {
        hooked_count += 1
      }.load
      expect(hooked_count).to eq(2)
    end

    it 'should get records' do
      User.delete_all
      user = User.create(name: 'John')
      record_size = 0
      record_ids = []
      User.all.on_load { |records|
        record_size = records.size
        record_ids = records.map(&:id)
      }.load
      expect(record_size).to eq(1)
      expect(record_ids).to eq([user.id])
    end
  end

  context 'when not loaded records' do
    it 'should not hooked on_load' do
      hooked_count = 0
      User.all.on_load { hooked_count += 1 }
      expect(hooked_count).to eq(0)
    end

    it 'should not hooked multi on_load' do
      hooked_count = 0
      User.all.on_load {
        hooked_count += 1
      }.on_load {
        hooked_count += 1
      }
      expect(hooked_count).to eq(0)
    end
  end

  context 'without on_load' do
    it 'should be normal' do
      expect(User.all.to_sql).to eq("SELECT \"users\".* FROM \"users\"")
    end
  end
end
