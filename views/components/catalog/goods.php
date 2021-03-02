<?php
/**
 * @var array $goods
 */
?>

<?php if (!empty($goods)) :?>

<div class="col-sm-8 col-md-9">
    <hr class="offset-lg">

    <div class="products">
        <div class="row">
            <?php foreach ($goods as $row) :?>

                <div class="col-sm-6 col-md-4 product">
                    <div class="body">
                        <a class="favorites" href="/" data-favorite="inactive"><i class="ion-ios-heart-outline"></i></a>
                        <a href="/"><img src="<?= $row['cover'] ?>" alt="<?= $row['cover_text'] ?>"/></a>

                        <div class="content px-2">
                            <h1 class="h4"><?= $row['title'] ?></h1>
                            <?php if (isset($row['sale'])) :?>
                                <p class="sale">$<?= $row['sale'] ?></p>
                                <p class="price through">$<?= $row['price'] ?></p>
                            <?php else :?>
                                <p class="price">$<?= $row['price'] ?></p>
                            <?php endif; ?>
                            <label><?= $row['product_type_title'] ?></label>

                            <button class="btn btn-link"><i class="ion-android-open"></i> Подробнее</button>
                            <button class="btn btn-primary btn-sm rounded"><i class="ion-bag"></i> В корзину</button>
                        </div>
                    </div>
                </div>

            <?php endforeach ?>
        </div>
    </div>

    <nav>
        <ul class="pagination">
            <li>
                <a href="/" aria-label="Previous">
                    <span aria-hidden="true"><i class="ion-ios-arrow-left"></i></span>
                </a>
            </li>
            <li class="active"><a href="/">1</a></li>
            <li><a href="/">2</a></li>
            <li>
                <a href="/" aria-label="Next">
                    <span aria-hidden="true"><i class="ion-ios-arrow-right"></i></span>
                </a>
            </li>
        </ul>
    </nav>
</div>

<?php endif; ?>
