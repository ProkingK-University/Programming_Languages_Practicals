<?php

if ($argc != 3) {
    echo "Usage: php s99999999.php7 <input_file> <word>\n";
    exit(1);
}

$inputFile = $argv[1];
$searchWord = strtolower($argv[2]);

if (!file_exists($inputFile) || !is_readable($inputFile)) {
    echo "The file does not exist or is not readable\n";
    exit(1);
}

$fileContent = file_get_contents($inputFile);
$formattedContent = strtolower($fileContent);
$formattedContent = preg_replace("/[^a-z]/", "", $formattedContent);

$reversedContent = strrev($formattedContent);
echo "{$reversedContent}\n";
$matches = substr_count($reversedContent, $searchWord);

echo "<html>\n<body>\n";
echo "<p>Matches: {$matches}</p>\n";
echo "</body>\n</html>";

?>
