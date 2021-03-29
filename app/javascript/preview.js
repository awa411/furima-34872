if ((document.URL.match( /new/ ) || document.URL.match( /edit/ ))&&!(document.URL.match( /cards/ ))) {
  document.addEventListener('DOMContentLoaded', function() {
    const ImageList = document.getElementById('image-list')

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length
      imageElement.setAttribute('id', `image-element[${imageElementNum}]`)

      
      // 表示する画像を生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)
      blobImage.setAttribute('class', 'image-content');
      
      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')
      //inputHTML.setAttribute('style', 'display: none;')
      
      
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)
      
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        
        createImageHTML(blob)
      })
      // imageElement.addEventListener('click', (e) => {
      //   const element = document.getElementById(`image-element[${imageElementNum}]`)
      //   const itemImage = document.getElementById(`item-image`)
      //   element.remove()  
      //   itemImage.value = ""
      //   if (document.querySelectorAll('.image-element').length == 0){
      //     const  upLoadMessage = document.getElementById('upload-message');
      //     upLoadMessage.innerHTML = `クリックしてファイルをアップロード`
      //   }
      //})
    }

      

     document.getElementById('item-image').addEventListener('change', (e) => {
    //   const imageContent = document.querySelector('img')
    //    if (imageContent){
    //     const  clickUpLoad = document.getElementById("click-upload");
    //     const  imgUpLoad = document.getElementById("img-upload");
    //     const  imageList = document.getElementById('image-list');
    //     const  upLoadMessage = document.getElementById('upload-message');
    //     imgUpLoad.insertBefore(clickUpLoad, imageList);
    //     upLoadMessage.innerHTML = `クリックしてファイルを追加(画像をクリックで選択解除)`
    //    }

      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)

    });
  });
}