<footer class="content-info">
  <div class="container">
    <?php dynamic_sidebar('sidebar-footer'); ?>
  </div>
  <div id='ecs-1' class="ecs" data-default-service="Essay" data-default-level="Undergraduate (1st and 2nd year)">

    <!--TITLE-->
    <div class="ecs__title ecs__title--shown-dsc"  style="display: none"><span class="ecs__title_dsc-percent"></span>% OFF YOUR FIRST ORDER!<br>LIMITED TIME!</div>
    <div class="ecs__title ecs__title--hidden-dsc">Get a quick estimate</div>
    <!--SERVICES-->
    <div class="ecs__service ecs__list">
      <span class="ecs__service__current">Essay</span>
    </div>
    <div class="ecs__list__wrapper ecs__list__wrapper--service">
      <input class="ecs__sort-list" placeholder="Type the Name of Service" type="text">
      <ul class="ecs__list--dropdown ecs__service__list"></ul>
    </div>


    <!--LEVELS-->
    <div class="ecs__level ecs__list">
      <span class="ecs__level__current">High School</span>
    </div>
    <div class="ecs__list__wrapper ecs__list__wrapper--level">
      <ul class="ecs__list--dropdown ecs__level__list"></ul>
    </div>


    <!-- DEADLINES -->
    <div class="ecs__deadline ecs__list">
      <span class="ecs__deadline__current">6 Hours</span>
    </div>
    <div class="ecs__list__wrapper ecs__list__wrapper--deadline">
      <ul class="ecs__list--dropdown ecs__deadline__list"></ul>
    </div>


    <!-- PAGE COUNT-->
    <div class="ecs__page-count">
      <div class="ecs__minus-btn">-</div>
      <span>
 <input type="number" min="1" max='30' class="ecs__page-input" value="1">
 <span class="ecs__page--subtitle">page</span>
 </span>
      <div class="ecs__plus-btn">+</div>
    </div>

    <!--PRICE-->
    <div class="ecs__price">
      <span class="ecs__price__title">Estimate price:</span>
      <span class="ecs__prices">
 <span class="ecs__price__old">10</span>
 <span class="ecs__price__value">$9</span>
 <span class="ecs__price__old__line"></span>
 </span>

    </div>

    <!--BUTTON-->
    <div class="ecs__btns">
      <div class="ecs__btn ecs__btn--inquiry">FREE QUOTE</div>
      <div class="ecs__btn ecs__btn--order">ORDER NOW</div>
    </div>
  </div>
  <script>
    var eduOptions = {
      'rangeColorChecked': "#ffed7b",
      'rangeColor': "#23e1ca",
      'rid': 1228, //обязательный параметр (идентификатор вебмастера)
      'dsc': '5F36A269',//дефолтный купон на скидку (опционально)
      'dev_mode': 'true', // напрямую использует скидку из настроек (нет проверки кукисов)
    }
  </script>
  <script src='https://99papers-1392.kxcdn.com/bundle35.js'></script>
</footer>
