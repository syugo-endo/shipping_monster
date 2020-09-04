require 'rails_helper'
describe Contact, type: :model do
  before do
    @contact = FactoryBot.build(:contact)
  end

  describe 'お問い合わせフォーム' do
    context '送信がうまくいく時' do
      it 'emailとmessageが存在していれば送信できる' do
        expect(@contact).to be_valid
      end
    end
    context '送信がうまくかない時' do
      it 'messageが空では送信できない' do
        @contact.message = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Messageを入力してください")
      end
      it 'emailが空では送信できない' do
        @contact.email = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Emailを入力してください")
      end
      it 'emailに@がありその後に.が含まれていないと送信できない' do
        @contact.email = 'testmanhaha'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Emailは不正な値です")
      end
    end
  end
end
