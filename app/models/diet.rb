class Diet < ApplicationRecord
  belongs_to :user
  
  validate :error
  
  before_save do
    self.sugar = ((( self.calorie - self.protein * 4 - self.fat * 9 ) / 4 ) / self.total_amount * self.intake ).round(2)
  end
    
  def error
    if start_time.blank? || name.blank? || total_amount.blank? || intake.blank? || calorie.blank? || protein.blank? || fat.blank? || carb.blank?
      errors[:base] << "未入力の項目があります"
    elsif total_amount < 0 || intake < 0 || calorie < 0 || protein < 0 || fat < 0 || carb < 0
      errors[:base] << "マイナスの値は登録できません"
    elsif name.length > 50
      errors[:base] << "品名は50文字以内で登録してください"
    elsif ((( self.calorie - self.protein * 4 - self.fat * 9 ) / 4 ) / self.total_amount * self.intake ).round(2) < 0
     errors[:base] << "糖質がマイナスの値です"
    end
  end
end