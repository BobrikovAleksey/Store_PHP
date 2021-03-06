<?php
/**
 * @var array $topDesktop
 */
?>

<?php if (!empty($lastDesktop) and count($lastDesktop) > 3) :?>

<section class="products">
    <div class="container">
        <h2 class="h2 upp align-center">Настольные компьютеры</h2>
        <hr class="offset-lg">

        <div class="row">
            <?php foreach ($lastDesktop as $key => $row) :?>

                <div class="col-sm-6 col-md-3 product">
                    <div class="body">
                        <a class="favorites" href="/" data-favorite="inactive"><i class="ion-ios-heart-outline"></i></a>
                        <a href="/"><img src="<?= $row['cover'] ?>" alt="<?= $row['cover_text'] ?>"/></a>

                        <div class="content align-center">
                            <?php if (isset($row['sale'])) :?>
                                <p class="sale">$<?= $row['sale'] ?></p>
                                <p class="price through">$<?= $row['price'] ?></p>
                            <?php else :?>
                                <p class="price">$<?= $row['price'] ?></p>
                            <?php endif; ?>

                            <h2 class="h3"><?= $row['title'] ?></h2>
                            <hr class="offset-sm">

                            <button class="btn btn-link"><i class="ion-android-open"></i> Подробнее</button>
                            <button class="btn btn-primary btn-sm rounded"><i class="ion-bag"></i> В корзину</button>
                        </div>
                    </div>
                </div>

            <?php endforeach ?>
        </div>

        <div class="align-right align-center-xs">
            <hr class="offset-sm">

            <a href="/"><h5 class="upp">Посмотреть все настольные компьютеры</h5></a>
        </div>
    </div>
</section>

<?php endif; ?>
