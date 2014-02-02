class InsertLanguageCodesToLanguages < ActiveRecord::Migration
  def change
    ['other', 'en', 'ja'].each do |code|
      Language.first_or_create(code: code)
    end
  end
end
