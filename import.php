<?php
// osTicket API URL and your API key
$apiUrl = 'http://localhost/os_icket/api/tickets.json';
$apiKey = '0472BA1E29443C8388E66CBFEA4FA884';  // Replace with your actual API key

// Prepare the ticket data
$ticketData = [
    'subject'   => 'fsdfdfdf Tifdsfdfcket',
    'message'   => 'This is a test ticketfsdf dfsd fsd fsd f sdfs sf created through the API.',
    'priority'  => 1,  // Low priority
    'status'    => 'open', // Open ticket status
    'dept_id'   => 1,  // Assuming department ID 1
    'staff_id'  => 1,  // Assuming staff ID 1 (Optional)
];

// Use cURL to send a POST request to the API
$ch = curl_init($apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'X-API-Key: ' . $apiKey,  // Authenticate using your API key
    'Content-Type: application/json',
]);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($ticketData));

$response = curl_exec($ch);
if(curl_errno($ch)) {
    echo 'Error:' . curl_error($ch);
} else {
    // Print the response (for debugging)
    echo $response;
}
curl_close($ch);
?>
