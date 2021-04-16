require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        binding.pry
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'emailが空だと保存できないこと' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが@無しだと保存できないこと' do
        @user.email = "hogehoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと保存できないこと' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満だと保存できないこと' do
        @user.password = "test1"
        @user.password_confirmation = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字のみだと保存できないこと' do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input alphanumeric characters.")
      end
      it 'passwordが英字のみだと保存できないこと' do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input alphanumeric characters.")
      end
      it 'password_confirmationが空だと保存できないこと' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが一致していないと保存できないこと' do
        @user.password_confirmation = "test1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと保存できないこと' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角日本語でないと保存できないこと' do
        @user.last_name = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it 'first_nameが空だと保存できないこと' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it 'last_kanaが空だと保存できないこと' do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'last_kanaが全角カタカナでないと保存できないこと' do
        @user.last_kana = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid. Input full-width katakana characters.")
      end
      it 'first_kanaが空だと保存できないこと' do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'first_kanaが全角カタカナでないと保存できないこと' do
        @user.first_kana = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid. Input full-width katakana characters.")
      end
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end