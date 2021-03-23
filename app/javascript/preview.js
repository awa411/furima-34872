if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const imageList = document.getElementById('image-list');
   
    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element");
      let imageElementNum = document.querySelectorAll('.image-element').length;
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', `image-content[${imageElementNum}]`)
      

      // const inputHTML = document.createElement('input');
      // inputHTML.setAttribute('id', `message_image_${imageElementNum}`);
      // inputHTML.setAttribute('name', 'message[images][]');
      // inputHTML.setAttribute('type', 'file');
      // inputHTML.setAttribute('class', 'message_image');
      // inputHTML.setAttribute('style', 'display: none;');
       blobImage.setAttribute('class', `image-content`);

       imageElement.appendChild(blobImage);
      // imageElement.appendChild(inputHTML);
       imageList.appendChild(imageElement);

      // inputHTML.addEventListener('change', (e) => {
          
      //   file = e.target.files[0];
      //   blob = window.URL.createObjectURL(file);

      //   createImageHTML(blob);
      // });
    };
   
    document.getElementById('item-image').addEventListener('change', function(e){
         const imageContent = document.querySelector('img');
         if (imageContent){
           const  clickUpLoad = document.getElementById("click-upload");
           const  imgUpLoad = document.getElementById("img-upload");
           const  imageList = document.getElementById('image-list');
           const  upLoadMessage = document.getElementById('upload-message');
           let imageElementNum = document.querySelectorAll('.image-element').length;
           imgUpLoad.insertBefore(clickUpLoad, imageList);
           upLoadMessage.innerHTML = `クリックして${imageElementNum+2}枚目の画像を追加できます`

         };
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      createImageHTML(blob);
    });
  });
}