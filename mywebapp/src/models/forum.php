<?php
require_once __DIR__ . '/../config/logger.php';
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../tools/UUIDGenerator.php';
class Forum {
    private $pdo;
    private $logger;
    public function __construct() {
        $this->pdo = Database::getInstance()->getConnection();
        $this->logger = new Logger('../logs/forum.log');
    }
    public function createPost($title, $description, $file, $userName, $category) {
        $idPost = UUIDGenerator::generate();
        $sql = "INSERT INTO forum (ID_POST, TITLE_POST, DESCRIPTION_POST, FILE_POST, USER_NAME_POST, CATEGORY_POST) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$idPost, $title, $description, $file, $userName, $category]);
        $this->logger->log ("Post added: {$idPost} - {$title} - {$description} - {$file} - {$userName} - {$category}");
        return ['success' => true, 'idPost' => $idPost]
    }


    
}
