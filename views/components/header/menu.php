<?php
/**
 * @var array $menu
 * @var string $page
 */
?>

<!--suppress HtmlFormInputWithoutLabel, HtmlUnknownAnchorTarget -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="/">Unistore</a>

            <a class="navbar-brand pull-right hidden-sm hidden-md hidden-lg" href="#open-cart">
                <i class="ion-bag"></i> 7
            </a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <?php foreach ($menu as $key => $item) :?>
                    <li class="<?= $key === $page ? 'active' : '' ?>">
                        <a href="<?= $item['link'] ?>"><?= $item['title'] ?></a>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>

        <div class="search hidden-xs" data-style="hidden">
            <div class="input">
                <button type="button"><i class="ion-ios-search"></i></button>

                <input type="text" name="search" value="" placeholder="Введите что вы ищите..." />
            </div>
        </div>
    </div>
</nav>
