/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        tsa: {
          navy: '#1e3a8a',
          red: '#dc2626',
          white: '#ffffff',
        },
        school: {
          primary: '#1e40af',
          secondary: '#dc2626',
        }
      },
      fontFamily: {
        'heading': ['Montserrat', 'sans-serif'],
        'body': ['Open Sans', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
