const API_URL = 'http://localhost:3000/people';

const personForm = document.getElementById('personForm');
const cancelBtn = document.getElementById('cancelBtn');
const personIdInput = document.getElementById('personId');


function getPersonIdFromUrl() {
    const params = new URLSearchParams(window.location.search);
    return params.get('id');
}


async function loadPersonData(id) {
    try {
        const response = await fetch(`${API_URL}/${id}`);
        if (!response.ok) throw new Error('Person not found');
        const person = await response.json();
        
        personIdInput.value = person.id;
        document.getElementById('fullName').value = person.fullName || '';
        document.getElementById('phoneNumber').value = person.phoneNumber || '';
        document.getElementById('address').value = person.address || '';
        document.getElementById('city').value = person.city || '';
        document.getElementById('state').value = person.state || '';
        document.getElementById('zipCode').value = person.zipCode || '';

    } catch (error) {
        console.error('Error loading person data:', error);
        alert('Could not load person data for editing. Redirecting to home.');
        window.location.href = 'index.html';
    }
}


async function handleSubmit(event) {
    event.preventDefault();
    
    const id = personIdInput.value;
    const url = `${API_URL}/${id}`;

    const personData = {
        id: parseInt(id), 
        fullName: document.getElementById('fullName').value,
        phoneNumber: document.getElementById('phoneNumber').value,
        address: document.getElementById('address').value,
        city: document.getElementById('city').value,
        state: document.getElementById('state').value,
        zipCode: document.getElementById('zipCode').value,
    };
    
    try {
        const response = await fetch(url, {
            method: 'PUT', 
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(personData)
        });
        
        if (!response.ok) throw new Error('Network response was not ok');

        alert('Person updated successfully!');
        window.location.href = 'index.html'; 
    } catch (error) {
        console.error('Update failed:', error);
        alert('Failed to save changes. Check console and JSON Server.');
    }
}


personForm.addEventListener('submit', handleSubmit);

cancelBtn.addEventListener('click', () => {
    window.location.href = 'index.html';
});


document.addEventListener('DOMContentLoaded', () => {
    const personId = getPersonIdFromUrl();
    if (personId) {
        loadPersonData(personId);
    } else {
        alert('No person ID provided for editing. Redirecting to home.');
        window.location.href = 'index.html';
    }
});