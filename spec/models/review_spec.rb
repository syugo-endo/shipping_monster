require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe 'レビュー投稿' do
    context 'レビューが投稿できる時' do
      it "nameとcontent、scoreが存在すれば送信できる" do
       
        expect(@review).to be_vailid
      end
    end

    context 'レビュー投稿ができない時' do
      it "nameが空だと登録できない" do
        @review.name = ""
        @review.valid?
        
        expect(@review.errors.full_messages).to include( "Nameを入力してください")
      end
      it "contentが空だと登録できない" do
        @review.content = "" 
        @review.valid?
     
        expect(@review.errors.full_messages).to include( "Contentを入力してください")
      end
      it "scoreが空だと登録できない" do
        @review.score = "" 
        @review.valid?
       
        expect(@review.errors.full_messages).to include("Scoreを入力してください")
      end
    end
  end
end
