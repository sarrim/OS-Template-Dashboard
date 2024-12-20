<?php

try {
    
    // API URL and your API key
    $apiUrl = 'http://localhost/os_ticket/api/tickets.json'; // Replace with your osTicket installation's API URL
    $apiKey = 'EBBC6812D73767013163C5F442F041C0';  // Replace with the API key generated in osTicket Admin Panel

    // Open the CSV file
    $file = fopen('tickets.csv', 'r');

    // Skip the first row (headers)
    fgetcsv($file);

    // Loop through each row in the CSV
    while (($data = fgetcsv($file)) !== FALSE) {
        // Extract ticket data from the CSV
        list($subject, $description, $priority, $status, $department, $created, $assigned_to) = $data;

        // Map department name to department ID (use your department IDs here)
        $departmentId = getDepartmentId($department);  // Function to map department name to ID
        $staffId = getStaffId($assigned_to);  // Function to map staff name/ID to staff ID

        // Prepare the data for the API request
        // $ticketData = [
        //     'subject'   => $subject,
        //     'message'   => $description,
        //     'priority'  => $priority,   // 1, 2, or 3 (Low, Medium, High)
        //     'status'    => $status,     // 'open', 'pending', 'closed', etc.
        //     'dept_id'   => $departmentId,  // Department ID (ensure the department exists in your osTicket)
        //     'staff_id'  => $staffId,       // Staff ID (ensure the staff exists in your osTicket)
        //     'created'   => strtotime($created),  // Convert created date to timestamp
        // ];

        $ticketData = [
            'subject'   => $data[0],  // Assuming the subject is in the first column
            'message'   => $data[1],  // Assuming the message is in the second column
            'priority'  => $data[2],  // Assuming priority is in the third column
            'status'    => $data[3],  // Assuming status is in the fourth column
            'dept_id'   => $data[4],  // Assuming department ID is in the fifth column
            // Add other fields as necessary (e.g., staff_id, custom fields)
            'name'      => 'John Doe',  // Client Name
            'email'     => 'johndoe@example.com',  // Client Email Address
        ];

        // Use cURL to send a POST request to the API
        $ch = curl_init($apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'X-API-Key: '.$apiKey,
            'Content-Type: application/json'
        ]);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($ticketData));

        if(curl_errno($ch)) {
            echo 'cURL Error: ' . curl_error($ch);
        } else {

            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            echo "HTTP Code: " . $httpCode . "\n";

            // Get the HTTP status code
            // $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            // echo "HTTP Code: " . $httpCode . "\n";
            // echo "<br />";
            
            // print_r($ch);
            // die($response);
            $response = curl_exec($ch);

            if(curl_errno($ch)) {
                echo 'Error:' . curl_error($ch);
            }
            curl_close($ch);

            // Optional: Log the response for debugging
            echo $response;
        }
    }

fclose($file);

echo "Tickets have been successfully imported!";

}
catch(Exception $e) {
    return 'Message: ' .$e->getMessage();
}

?>

<?php
// Function to map department name to department ID
function getDepartmentId($departmentName) {
    $departments = [
        'Support' => 1,  // Map the name 'Support' to department ID 1
        'Billing' => 2,   // Map 'Billing' to department ID 2
        // Add more departments as needed
    ];
    return isset($departments[$departmentName]) ? $departments[$departmentName] : null;
}

// Function to map staff name/ID to staff ID
function getStaffId($staffName) {
    // You can either map by name or directly use staff IDs if you know them
    $staff = [
        'Agent1' => 1,  // Example: Map staff 'Agent1' to staff ID 1
        'Agent2' => 2,  // Map 'Agent2' to staff ID 2
        // Add more staff members as needed
    ];
    return isset($staff[$staffName]) ? $staff[$staffName] : null;
}
?>
