<?php

$articles = [
    [
        'title' => 'PHP Basics',
        'category' => 'Programming',
        'published' => true,
    ],
    [
        'title' => 'Web Development with PHP',
        'category' => 'Web Development',
        'published' => true,
    ],
    [
        'title' => 'Introduction to JavaScript',
        'category' => 'Programming',
        'published' => false,
    ],
    [
        'title' => 'Building Responsive Websites',
        'category' => 'Web Development',
        'published' => true,
    ],
    [
        'title' => 'Database Design and SQL',
        'category' => 'Database',
        'published' => true,
    ],
];

function filterArticles($articles, $category)
{
    $filteredArticles = [];

    foreach ($articles as $article) {
        if ($article['category'] === $category && $article['published']) {
            $filteredArticles[] = $article;
        }
    }

    return $filteredArticles;
}

$webDevelopmentArticles = filterArticles($articles, 'Web Development');

foreach ($webDevelopmentArticles as $article) {
    echo $article['title'] . "\n";
}
