function runScenario() {
  const scenario = document.getElementById("scenario").value;
  const input = document.getElementById("inputData").value.trim();
  let result = "";

  function isValidPuzzleWord(word) {
    const vowels = "aeiouAEIOU";
    if (!word) return "Enter a word";
    if (!vowels.includes(word[0]) || !vowels.includes(word[word.length - 1]))
      return "Invalid";
    let insideVowels = 0;
    for (let i = 1; i < word.length - 1; i++)
      if (vowels.includes(word[i])) insideVowels++;
    return insideVowels === 2 ? "Valid" : "Invalid";
  }

  function outOfOrderCount(arr) {
    let sorted = [...arr].sort((a, b) => a - b);
    let count = 0;
    for (let i = 0; i < arr.length; i++) if (arr[i] !== sorted[i]) count++;
    return count / 2;
  }

  function assignTeams(skills) {
    skills.sort((a, b) => b - a);
    let teamA = [],
      teamB = [],
      sumA = 0,
      sumB = 0;
    for (let s of skills) {
      if (sumA <= sumB) {
        teamA.push(s);
        sumA += s;
      } else {
        teamB.push(s);
        sumB += s;
      }
    }
    return `Team A: [${teamA}] | Team B: [${teamB}]`;
  }

  function generateRanks(marks) {
    marks.sort((a, b) => b - a);
    return marks.map((m, i) => `${i + 1}. ${m}`).join("<br>");
  }

  function checkJackpot(num) {
    const str = num.toString();
    const sum = str.split("").reduce((a, b) => a + Number(b), 0);
    return str === str.split("").reverse().join("") && sum % 3 === 0
      ? "Jackpot!"
      : "Try Again";
  }

  function bookSeats(preferences) {
    const totalSeats = 40;
    const booked = new Set();
    let output = "";
    for (let seat of preferences) {
      if (seat < 1 || seat > totalSeats) continue;
      if (booked.has(seat)) output += `Seat ${seat} Already Booked<br>`;
      else {
        booked.add(seat);
        output += `Seat ${seat} Booked<br>`;
      }
    }
    return output;
  }

  function encodePassword(password) {
    const vowels = "aeiouAEIOU";
    return password
      .split("")
      .map((ch) => {
        if (vowels.includes(ch)) return "@";
        if (!isNaN(ch) && Number(ch) % 2 === 0) return "*";
        return ch.toUpperCase();
      })
      .join("");
  }

  function validateSeats(ids) {
    for (let i = 0; i < ids.length - 1; i++) {
      if (ids[i] % 10 === ids[i + 1] % 10)
        return `Invalid - ${ids[i]} and ${ids[i + 1]} have same last digit`;
    }
    return "Valid Seating";
  }

  function patternLock(attempts) {
    const correct = "1234";
    for (let a of attempts) if (a === correct) return "Success!";
    return "System Locked!";
  }

  function reverseOddDigits(num) {
    return num
      .toString()
      .split("")
      .filter((d) => d % 2 !== 0)
      .reverse()
      .join("");
  }

  let arrInput = input.split(",").map((i) => i.trim());

  switch (scenario) {
    case "1":
      result = isValidPuzzleWord(input);
      break;
    case "2":
      result = outOfOrderCount(arrInput.map(Number));
      break;
    case "3":
      result = assignTeams(arrInput.map(Number));
      break;
    case "4":
      result = generateRanks(arrInput.map(Number));
      break;
    case "5":
      result = checkJackpot(Number(input));
      break;
    case "6":
      result = bookSeats(arrInput.map(Number));
      break;
    case "7":
      result = encodePassword(input);
      break;
    case "8":
      result = validateSeats(arrInput.map(Number));
      break;
    case "9":
      result = patternLock(arrInput);
      break;
    case "10":
      result = reverseOddDigits(Number(input));
      break;
    default:
      result = "Invalid scenario";
  }

  document.getElementById("result").innerHTML = result;
}
