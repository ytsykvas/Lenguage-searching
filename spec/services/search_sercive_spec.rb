# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchService do
  let(:data) do
    JSON.parse(File.read('public/languages.json'))
  end

  subject { described_class.new(data) }

  describe '#search' do
    context 'Searching in "Designed by" field' do
      it 'is not case sensitive' do
        results = subject.search('Microsoft')
        expect(results.all? { |item| item['Designed by'].include?('Microsoft') }).to be true
      end

      it 'returns 8 records for query "Microsoft"' do
        results = subject.search('Microsoft')
        expect(results.size).to eq(8)
        expect(results.first['Name']).to eq('C#')
        expect(results.last['Name']).to eq('X++')
      end
    end

    context 'Search returns the most relevant result' do
      it 'returns first result with more searched letter' do
        results = subject.search('A')
        first_result = results.first.values.join.downcase.count('a')
        last_result = results.last.values.join.downcase.count('a')
        expect(first_result).to be > last_result
      end
    end

    context 'Support for negative searches' do
      it 'returns 4 records for query "john -array"' do
        results = subject.search('john -array')
        expect(results.size).to eq(4)
        expect(results.first['Name']).to eq('BASIC')
        expect(results.last['Name']).to eq('S-Lang')
      end
    end

    context 'Searching with phrase or few words' do
      it 'returns 1 record for query "Lisp Common"' do
        results = subject.search('Lisp Common')
        expect(results.size).to eq(1)
      end

      it 'returns 1 record for query "Thomas Eugene"' do
        results = subject.search('Thomas Eugene')
        expect(results.size).to eq(1)
      end
    end
  end
end
