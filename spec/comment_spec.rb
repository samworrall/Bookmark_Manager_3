require 'comment'

describe Comment, :comment do
  let(:comment) { Comment.new('Test comment') }

  describe '#text' do
    it 'returns the comment text' do
      expect(comment.text).to eq 'Test comment'
    end
  end
end
