module SchoolsHelper
  def date_japan(time)
    time.strftime("%Y年/%m月/%d日(#{%w(日 月 火 水 木 金 土)[time.wday]})")
  end

  # ログインしている且つ、ユーザー自身かどうかを判定する
  def is_current_user?(comparison_user)
    if user_signed_in?
      true if current_user.id == comparison_user.id
    end
  end

  def choose_new_or_edit
    if action_name == 'new'
      school_posts_path
    elsif action_name == 'edit'
      school_post_path
    end
  end

  #編集画面でスコアがすでに登録されてる場合に、ポイントをセット
  def score_present__point_set(score, index, point)
    if score.present?
      hidden_field_tag "post_score" + "#{[index]}" + "[point]", point
    else
      hidden_field_tag "post_score" + "#{[index]}" + "[point]"
    end
  end

  def badge_color(content, index)
    @badge = %w[badge-info badge-warning badge-success badge-primary badge-rose]
    content_tag(:div, content, class: "badge #{@badge[index]}")
  end
end
