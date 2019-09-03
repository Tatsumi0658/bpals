module ProfilesHelper
  def judge_age(age_value)
    if age_value == 1
      t("view.profile.late 10's ~ early 20's")
    elsif age_value == 2
      t("view.profile.late 20's")
    elsif age_value == 3
      t("view.profile.early 30's")
    elsif age_value == 4
      t("view.profile.late 30's~")
    elsif age_value == 5
      t("view.profile.age_unknown")
    end
  end

  def judge_skintype(skintype_value)
    if skintype_value == 1
      t('view.profile.normal')
    elsif skintype_value == 2
      t('view.profile.dry')
    elsif skintype_value == 3
      t('view.profile.oily')
    elsif skintype_value == 4
      t('view.profile.mixed')
    elsif skintype_value == 5
      t('view.profile.skin_unknown')
    end
  end
end
