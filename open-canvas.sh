#!/bin/bash

echo "🎨 Creative Canvas - Digital Art Studio"
echo "======================================="
echo ""
echo "Your Creative Canvas is ready!"
echo ""
echo "📍 File location: /workspace/creative-canvas.html"
echo ""
echo "🌐 Try these URLs in your browser:"
echo "   → http://localhost:8080/creative-canvas.html"
echo "   → http://127.0.0.1:8080/creative-canvas.html"
echo ""
echo "💡 Or open the file directly in your browser:"
echo "   → file:///workspace/creative-canvas.html"
echo ""
echo "🚀 Server is running on port 8080..."

# Check if server is running
if pgrep -f "python3 -m http.server 8080" > /dev/null; then
    echo "✅ Server is running!"
else
    echo "⚠️  Starting server..."
    python3 -m http.server 8080 --bind 0.0.0.0 &
    sleep 2
    echo "✅ Server started!"
fi

echo ""
echo "🎨 Happy drawing! Create amazing digital art!"