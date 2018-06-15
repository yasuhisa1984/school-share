$(function() {
  let post_score_array = [
    "#post_score_0_point",
    "#post_score_1_point",
    "#post_score_2_point",
    "#post_score_3_point",
    "#post_score_4_point"
  ];

  $.each(post_score_array, function(index, value){
    console.log($(value).val());
    let var_score = $(value).val();

    //変数の値が未定義なら、星のスコアを初期化する
    //定義済みは変数を設定する。


    if (var_score !== 'undefined') {
      $(".points" + index).raty({
        score: var_score, starType: 'i'}
      );
    } else {
      $(".points" + index).raty({
        score: 0, starType: 'i'}
      );
    }

    //raty-jsの設定、クリックされたらhidden_fieldに値をセットする
    $(".points" + index).raty('set', {
      click: function(score) {
        $(value).val(score);
      }
    });
  });

  //入力項目の検証ルール定義
  let rules = {
    'post[when_from_id]': { required: true },
    'post[course_id]': { required: true },
    'post[post_purposes_attributes][0][purpose_id]': { required: true },
    'post[story]': { required: true },
    'post[skills_attributes][0][name]': { required: true },
    'post[skills_attributes][1][name]': { required: true },
    'post[skills_attributes][2][name]': { required: true },
    'post_score[0][point]': { required: true },
    'post_score[1][point]': { required: true },
    'post_score[2][point]': { required: true },
    'post_score[3][point]': { required: {
      // スキル4(任意)の入力値検証に成功している場合のみ
      depends:function() {
          let value_check3 = $("input[name='post[skills_attributes][3][name]']").val();
          console.log(value_check3);
          if(value_check3)
          {
            return true;
          }
          else
          {
            return false;
          }
        }
      }
    },
    'post_score[4][point]': { required: {
      depends:function() {
          let value_check4 = $("input[name='post[skills_attributes][4][name]']").val();
          console.log(value_check4);
          if(value_check4)
          {
            return true;
          }
          else
          {
            return false;
          }
        }
      }
    }
  }

  //入力項目ごとのエラーメッセージ定義
  let messages = {
    'post[when_from_id]': { required: "いつ頃在学していたかを選択してください" },
    'post[course_id]': { required: "在学していたコースを選択してください" },
    'post[post_purposes_attributes][0][purpose_id]': { required: "入校した目的を選択してください" },
    'post[story]': { required: "役立ったエピソードを入力してください" },
    'post[skills_attributes][0][name]': { required: "スキル1を入力してください" },
    'post[skills_attributes][1][name]': { required: "スキル2を入力してください" },
    'post[skills_attributes][2][name]': { required: "スキル3を入力してください" },
    'post_score[0][point]': { required: "スキル1の評価を選択してください" },
    'post_score[1][point]': { required: "スキル2の評価を選択してください" },
    'post_score[2][point]': { required: "スキル3の評価を選択してください" },
    'post_score[3][point]': { required: "スキル4の評価を選択してください" },
    'post_score[4][point]': { required: "スキル5の評価を選択してください" }
  };

  //バリデーションの設定
  $("#new_post").validate({
    ignore: [],
    rules: rules,
    messages: messages,
    errorPlacement: function(error, element) {
      //指定タグの中に出したい場合はappendTo()
      error.appendTo($('#error_message'));
    }
  });
});
