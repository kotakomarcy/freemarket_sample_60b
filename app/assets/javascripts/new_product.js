$(function() {
  //画像用inputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file"
                    name="product[product_images_attributes][${index}][image]"
                    id="product_product_images_attributes_${index}_image">
                    <br>
                    <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使って、inputを生成
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    //末尾に１足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    //画像入力欄が0にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});