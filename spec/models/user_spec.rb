require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で半角英数字であれば登録できる' do
        @user.password = '123abcd'
        @user.password_confirmation = '123abcd'
        expect(@user).to be_valid
      end
      it 'family_nameとfirst_nameが全角で入力されている' do
        @user.family_name = '山田'
        @user.first_name = '太郎'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'family_name_kanaとfirst_name_kanaが全角カタカナで入力されている' do
        @user.family_name = 'ヤマダ'
        @user.first_name = 'タロウ'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
      end
      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = '123333'
        @user.password_confirmation = '123333'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは半角英数混合で入力してください。")
      end
      it 'family_nameとfirst_nameが全角で入力されている' do
        @user.family_name = 'yamada'
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family nameは全角で入力してください。", "First nameは全角で入力してください。")
      end
    end
  end
end