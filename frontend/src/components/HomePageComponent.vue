<template>
  <div>
    <img class="bg" src="https://static.vecteezy.com/system/resources/previews/007/621/002/original/blue-wave-abstract-background-web-background-blue-texture-banner-design-creative-cover-design-backdrop-minimal-background-illustration-vector.jpg" alt="">
  </div>
  <div class="container">
    <h1 class="text-center display-3 ">
      Köszöntjük az Okospanzió weboldalán!
    </h1>
    <h6 class="text-center my-3">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati quos
      recusandae praesentium reprehenderit quas assumenda earum aliquam
      cupiditate!
    </h6>
    <p class="text-center my-3">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat officiis
      eligendi excepturi dolorum quasi in explicabo pariatur cumque tempora quia
      quas cum doloribus minus eos deleniti voluptatibus, delectus quod ex!
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore
      quisquam, iusto sit possimus dolore aut nemo ullam ratione veniam
      perferendis quaerat doloribus eos fugiat ipsam facilis quos soluta,
      deleniti laboriosam. Lorem ipsum dolor sit amet, consectetur adipisicing
      elit. Animi similique minus non illo dolorum laudantium, ab, rem cum quas
      aliquid vero id illum eius neque veniam magni amet, eaque corrupti.
    </p>
  </div>



<div class="container mx-auto">
<div class="row justify-content-center p-auto">
<!-- jobb oldali kepes kartya -->
<div class="m-3 col-12 col-md-4 col-sm-6 ">
    <router-link to="/restaurant" class="route">
    <div class="card mb-3">
      <div class="row g-0">
        <div class=" card-body">
            <h5 class="card-title text-center" style="color: black;">Étterem</h5>
            <img
            src="https://www.csilietterem.hu/assets/img/slider/1.jpg"
            class="img-fluid rounded-start"
            alt="..."
          />
            <p class="card-text mt-1">
              <small class="text-muted">Próbáld ki te is!</small>
            </p>
         
        </div>
      </div>
    </div> 
  </router-link>
  </div>

  <!-- kartya vege -->


  <!-- bal oldali kepes kartya -->
  <div class=" m-3 col-12 col-md-4 col-sm-6 ">
    <router-link to="/gym" class="route">
    <div class="card mb-3 ">
      <div class="row g-0">
          <div class="card-body">
            <h5 class="card-title text-center" style="color: black;">Konditerem</h5>
            <img
            src="https://lawliberty.org/app/uploads/2022/09/shutterstock_1471750145.jpeg"
            class="img-fluid rounded-start"
            alt="..."
          />
            <p class="card-text mt-1">
              <small class="text-muted">Próbáld ki te is!</small>
            </p>
          </div>
      </div>
    </div> 
  </router-link>
  </div>
  <!-- kartya vege -->


  <!-- jobb oldali kepes kartya -->

  <div class=" m-3 col-12 col-md-4 col-sm-6 ">
    <router-link to="/pool" class="route">
    <div class="card mb-3 ">
      <div class="row g-0">
        <div class=" card-body">
            <h5 class="card-title text-center" style="color: black;">Medence</h5>
            <img
            src="https://assets.langhamhotels.com/is/image/langhamhotelsstage/cdakl-wellness-pool-2800-1800:Medium?wid=2121&hei=1193"
            class="img-fluid rounded-start"
            alt="..."
          />
            <p class="card-text mt-1">
              <small class="text-muted">Próbáld ki te is!</small>
            </p>
         
        </div>
      </div>
    </div> 
  </router-link>
  </div>
  <!-- kartya vege -->

  <!-- bal oldali kepes kartya -->
  <div class="m-3 col-12 col-md-4 col-sm-6 ">
    <router-link to="/sauna" class="route">
    <div class="card mb-3 ">
      <div class="g-0">
          <div class="card-body">
            <h5 class="card-title text-center" style="color: black;">Szauna</h5>
            <img
            src="https://balneohotel.hu/application/files/4116/4992/7732/balneo-hotel-szauna.jpg"
            class="img-fluid"
            alt="..."
          />
            <p class="card-text mt-1">
              <small class="text-muted">Próbáld ki te is!</small>
            </p>
        </div>
      </div>
    </div> 
  </router-link>
  </div>

  <!-- kartya vege -->


</div>
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
  min-height: 100rem;
  width: 100%;
  position: fixed;
  z-index: -4;
  filter: brightness(150%);
  filter: opacity(20%);
  top: 0rem;
}
.text-center{
  color: rgba(0, 0, 0, 0.589);
}


.route{
  text-decoration: none;
  color: rgb(66, 66, 66);
}


.img-fluid{
  width: fit-content;
  min-height:fit-content;
  aspect-ratio: 3/2;
  flex-grow: inherit;
  object-fit: cover;
  margin: 0px;
}



.card {
  width: 100%;
  height: 100%;
  border-radius: 20px;
  background: #ffffff3f;
  position: relative;
  padding: 1.8rem;
  border: 4px solid #ffffff;
  transition: 0.5s ease-out;
  overflow: visible;
}

.card-details {
  color: black;
  height: 100%;
  gap: 0.5em;
  display: grid;
  place-content: center;
}


.text-body {
  color: rgb(134, 134, 134);
}

/*Text*/
.text-title {
  font-size: 1.5em;
  font-weight: bold;
  text-align: center;
}

/*Hover*/
.card:hover {
  border-color: #008bf8;
  background-color: #a7f6ff6d;
  box-shadow: 0 4px 18px 0 rgba(0, 0, 0, 0.25);
  transform: scale(1.05);
  transition: 0.5s;
}


</style>
