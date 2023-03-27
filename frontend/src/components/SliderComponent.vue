<template>
<div id="carouselExampleAutoplaying" class="carousel slide " data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://parkhoteltokyo.com/wp-content/uploads/sites/9/2020/06/westlounge_3_parkhoteltokyo_202110-1600x500.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://parliamenthouse-hotel.co.uk/wp-content/uploads/2020/03/suite2-1-1600x500.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://passport-cdn.kiwicollection.com/blog/drive/uploads/2018/07/Mondrian-Los-Angeles-Pool-Feature-1920x833.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</template>

<script setup>

</script>

<style lang="scss" scoped>

.carousel-item img{
    aspect-ratio: 4/1;
    flex-grow: inherit;
    box-shadow: inset 50vw;
}

.carousel-item h5 p{
    color: white;
}
</style>