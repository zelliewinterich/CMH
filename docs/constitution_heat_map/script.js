function changeThinkerSelection() {
    var selector = document.getElementById("thinkerSelector");
    var selectedValue = selector.value;

    // Logic to handle the "None" selection
    if (selectedValue === "None") {
        // Remove color effects or reset styling
        document.querySelectorAll('.section').forEach(function(section) {
            section.style.backgroundColor = "white"; // Clear the background color
            section.style.boxShadow = "none"; // Remove the glow effect
        });
    } else {
        var selectedThinker = selectedValue;
        var sections = document.getElementsByClassName('section');
        for (var i = 0; i < sections.length; i++) {
            var section = sections[i];
            var significanceValue = parseFloat(section.getAttribute('data-' + selectedThinker)) || 0; // Default to 0 if NaN
            section.style.backgroundColor = getColorForSignificance(significanceValue);
            section.style.boxShadow = getGlowForSignificance(significanceValue); // Add glow effect
        }
    }
}

function getColorForSignificance(significance) {
    // Ensure significance is a number and within the range of 0 to 1
    var normalizedSignificance = Math.min(Math.max(significance, 0), 1);

    // Enhance the low end of the scale to avoid dark colors
    var red = Math.round(255 * (1 - normalizedSignificance) + 50); // Increase the red component for a brighter effect
    var green = Math.round(255 * normalizedSignificance + 50); // Increase the green component for more vibrance
    var blue = 0; // Blue stays constant to focus the transition between red and green

    // Return the RGB color, transitioning from light red to yellow to green
    return `rgb(${red}, ${green}, ${blue})`;
}

function getGlowForSignificance(significance) {
    // Ensure significance is a number and within the range of 0 to 1
    var normalizedSignificance = Math.min(Math.max(significance, 0), 1);

    // Set the intensity and spread of the glow effect, increase brightness
    var glowIntensity = 20 + (normalizedSignificance * 50); // Stronger glow effect for more significance
    var color = getColorForSignificance(significance); // Use the same color for the glow

    // Return a box-shadow with a bold and pronounced glow effect
    return `0 0 ${glowIntensity}px ${color}, 0 0 ${glowIntensity / 2}px ${color}`;
}
