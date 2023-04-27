<template>
  <div>
    <img
      class="bg"
      src="https://images.squarespace-cdn.com/content/v1/5e279c1ad8a7ad41e680b1d4/1591747768278-Z1RFJYH0F58WIJ7WNAZS/PresPoolsOct2018-2b.jpg?format=1500w"
      alt=""
    />
    <p class="display-1 text-center mb-5" id="title" style="color: white">Uszoda</p>
  </div>

  <div class="container">
    <div class="row justify-content-center">
      <table class="table">
        <thead>
          <tr>
            <td>Medencék adatai</td>
            <td>Szélesség</td>
            <td>Hosszúság</td>
            <td>Mélység</td>
            <td>Hőfok</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>belső úszómedence</td>
            <td>16m</td>
            <td>25m</td>
            <td>2m</td>
            <td>26-28 &#8451;</td>
          </tr>
          <tr>
            <td>külső úszómedence</td>
            <td>16m</td>
            <td>25m</td>
            <td>2m</td>
            <td>26-28 &#8451;</td>
          </tr>
          <tr>
            <td>belső tanmedence</td>
            <td>8m</td>
            <td>4,5m</td>
            <td>1,35m</td>
            <td>26-32 &#8451;</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

  <div class="container mt-5">
    <div class="text-center" style="color: white">
      <h5>
        Az úszni vágyóknak tökéletes választás az uszoda, hiszen kisgyerkekkel
        is remek időtöltést nyújt az uszoda részleg.
      </h5>
      <p>
        A hotel 3 medence található, amit minden nap igénybe tudnak venni az
        érdeklődők.
      </p>
    </div>
  </div>

  <div class="container">
        <div class="row justify-content-center">
        <div class=" col-12 col-md-4 col-sm-6 m-2">
  <img src="https://cdn.wallpapersafari.com/61/37/Epf7RI.jpg" class="card-img" alt="...">
</div>
<div class=" col-12 col-md-4 col-sm-6 m-2">
  <img src="https://images.squarespace-cdn.com/content/5f06d673352720325a1f3b5d/1626685519270-REGZB8AWDZUDUYAD0QEY/DSC05812.jpg?format=1500w&content-type=image%2Fjpeg" class="card-img" alt="...">
</div>
<div class="col-12 col-md-4 col-sm-6 m-2">
  <img src="https://www.parents.com/thmb/n6QOFNkgz37rAkphNgMFBYsGDGc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/water-safety-b2f3027a9761427a8613aa0343753758.jpg" class="card-img" alt="...">
</div>
</div>
    </div>

  <div class="container my-5">
    <h2 class="text-center" style="color: white">Niytvatartásunk</h2>
    <h4 class="text-center" style="color: #bababa">
      Hétfő-Péntek: 5:00 - 23:00
    </h4>
    <h4 class="text-center" style="color: #bababa">Szombat: 6:00 - 22:00</h4>
    <h4 class="text-center" style="color: #bababa">Vasárnap: 6:00 - 20:00</h4>
  </div>
</template>

<script setup></script>

<style lang="scss" scoped>
.bg {
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center center;
  background-size: cover;
  object-fit: cover;
  width: 100%;
  position: fixed;
  z-index: -4;
  filter: blur(15%);
  filter: brightness(25%);
}

.card-img{
  transition: 0.5s;
}
.table {
  color: rgb(255, 255, 255);
  background-color: rgba(0, 92, 252, 0.504);
  border: 1px solid white ;
  width: 50%;
  
}

@media (max-width: 767px)
{
  .table{
    width: 90%;
    display: block;
    overflow-x: auto;
    white-space: nowrap;
    
  }
  .bg{
    width: auto;
  }
}

.card-img{
    border: solid 2px white;
    max-height: 25vh;
    object-fit: cover;
}


@media (min-width:767px ){
.card-img:hover{
  transform: scale(1.5);
  transition: 0.5s;
  transition-delay: 0.5s;

}
}
</style>
