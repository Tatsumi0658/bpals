module ProfilesHelper
  def judge_age(age_value)
    if age_value == 1
      "10代後半~20代前半"
    elsif age_value == 2
      "20代後半"
    elsif age_value == 3
      "30代前半"
    else
      "30代後半以上"
    end
  end

  def judge_skintype(skintype_value)
    if skintype_value == 1
      "混合肌"
    else
      "乾燥肌"
    end
  end

  def judge_purpose(purpose_value)
    if purpose_value == 1
      "仕事"
    else
      "ファッション"
    end
  end
end
