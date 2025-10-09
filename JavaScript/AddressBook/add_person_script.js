const API_URL = 'http://localhost:3000/people';

const personForm = document.getElementById('personForm');
const cancelBtn = document.getElementById('cancelBtn');


async function handleSubmit(event) {
    event.preventDefault();
    
    const personData = {
        fullName: document.getElementById('fullName').value,
        phoneNumber: document.getElementById('phoneNumber').value,
        address: document.getElementById('address').value,
        city: document.getElementById('city').value,
        state: document.getElementById('state').value,
        zipCode: document.getElementById('zipCode').value,
    };
    
    try {
        const response = await fetch(API_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(personData)
        });
        
        if (!response.ok) {
            throw new Error(`Server responded with status: ${response.status}`);
        }

        alert('Person added successfully!');
        window.location.href = 'index.html';

    } catch (error) {
        console.error('Submission failed:', error);
        alert('Failed to add person. Check console and ensure JSON Server is running.'); 
    }
}

personForm.addEventListener('submit', handleSubmit);

cancelBtn.addEventListener('click', () => {
    window.location.href = 'index.html';
});