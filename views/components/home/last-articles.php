<?php
/**
 * @var array $lastArticles
 */
?>

<?php if (!empty($lastArticles) and count($lastArticles) > 1) :?>

<section class="blog">
    <div class="container">
        <h2 class="h2 upp align-center">Свежие статьи в блоге</h2>
        <hr class="offset-lg">

        <div class="row">
            <?php foreach ($lastArticles as $row) :?>

            <div class="col-sm-6 col-md-6 item">
                <div class="body">
                    <a href="/" class="view"><i class="ion-ios-book-outline"></i></a>

                    <a href="/">
                        <img src="<?= $row['cover'] ?>" alt="<?= $row['cover_text'] ?>"
                             title="<?= $row['cover_text'] ?>">
                    </a>

                    <div class="caption">
                        <h2 class="h3"><?= $row['title'] ?></h2>
                        <label><?= date('d.m.Y', strtotime($row['created_at'])) ?></label>
                        <hr class="offset-sm">

                        <p><?= $row['synopsis'] ?></p>
                        <hr class="offset-sm">

                        <a href="/">Посмотреть полностью <i class="ion-ios-arrow-right"></i></a>
                    </div>
                </div>
            </div>

            <?php endforeach ?>
        </div>

        <div class="align-right align-center-xs">
            <hr class="offset-sm">
            <a href="/"><h5 class="upp">Посмотреть все статьи</h5></a>
        </div>
    </div>
</section>

<?php endif; ?>
