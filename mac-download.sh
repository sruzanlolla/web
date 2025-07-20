#!/bin/bash

echo "🍎 Mac Download Script for Creative Canvas"
echo "=========================================="
echo ""
echo "Creating creative-canvas.html on your Desktop..."

cat > ~/Desktop/creative-canvas.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creative Canvas - Digital Art Studio</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: white;
            text-align: center;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            font-size: 2.5em;
        }

        .app-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            padding: 20px;
            max-width: 1000px;
            width: 100%;
        }

        .toolbar {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 15px;
        }

        .tool-group {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
        }

        .tool-group label {
            font-weight: bold;
            color: #333;
            font-size: 0.9em;
        }

        button {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        button.active {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
        }

        input[type="range"] {
            width: 100px;
            margin: 0 10px;
        }

        input[type="color"] {
            width: 50px;
            height: 50px;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .canvas-container {
            text-align: center;
            position: relative;
        }

        canvas {
            border: 3px solid #ddd;
            border-radius: 15px;
            cursor: crosshair;
            background: white;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            max-width: 100%;
        }

        .controls {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
        }

        .size-display {
            background: #333;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-weight: bold;
            min-width: 60px;
            text-align: center;
        }

        .preset-colors {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .preset-color {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            border: 3px solid white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            transition: transform 0.2s ease;
        }

        .preset-color:hover {
            transform: scale(1.1);
        }

        .pattern-btn {
            background: linear-gradient(45deg, #9b59b6, #8e44ad);
        }

        .pattern-btn:hover {
            background: linear-gradient(45deg, #8e44ad, #9b59b6);
        }

        .rainbow-btn {
            background: linear-gradient(45deg, #ff0000, #ff7f00, #ffff00, #00ff00, #0000ff, #4b0082, #9400d3);
        }

        @media (max-width: 768px) {
            .toolbar {
                flex-direction: column;
            }
            
            h1 {
                font-size: 2em;
            }
            
            .app-container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <h1>🎨 Creative Canvas</h1>
    
    <div class="app-container">
        <div class="toolbar">
            <div class="tool-group">
                <label>Drawing Tools</label>
                <div class="controls">
                    <button id="brushTool" class="active">🖌️ Brush</button>
                    <button id="eraserTool">🧽 Eraser</button>
                    <button id="sprayTool">💨 Spray</button>
                </div>
            </div>

            <div class="tool-group">
                <label>Brush Size</label>
                <div style="display: flex; align-items: center;">
                    <input type="range" id="brushSize" min="1" max="50" value="5">
                    <span class="size-display" id="sizeDisplay">5px</span>
                </div>
            </div>

            <div class="tool-group">
                <label>Colors</label>
                <div style="display: flex; flex-direction: column; gap: 10px; align-items: center;">
                    <input type="color" id="colorPicker" value="#ff6b6b">
                    <div class="preset-colors">
                        <div class="preset-color" style="background: #ff6b6b" data-color="#ff6b6b"></div>
                        <div class="preset-color" style="background: #4ecdc4" data-color="#4ecdc4"></div>
                        <div class="preset-color" style="background: #45b7d1" data-color="#45b7d1"></div>
                        <div class="preset-color" style="background: #96ceb4" data-color="#96ceb4"></div>
                        <div class="preset-color" style="background: #feca57" data-color="#feca57"></div>
                        <div class="preset-color" style="background: #ff9ff3" data-color="#ff9ff3"></div>
                        <div class="preset-color" style="background: #54a0ff" data-color="#54a0ff"></div>
                        <div class="preset-color" style="background: #000000" data-color="#000000"></div>
                    </div>
                </div>
            </div>

            <div class="tool-group">
                <label>Special Effects</label>
                <div class="controls">
                    <button id="rainbowMode" class="rainbow-btn">🌈 Rainbow</button>
                    <button id="patternMode" class="pattern-btn">✨ Patterns</button>
                </div>
            </div>

            <div class="tool-group">
                <label>Actions</label>
                <div class="controls">
                    <button id="clearCanvas" style="background: linear-gradient(45deg, #e74c3c, #c0392b);">🗑️ Clear</button>
                    <button id="saveImage" style="background: linear-gradient(45deg, #3498db, #2980b9);">💾 Save</button>
                </div>
            </div>
        </div>

        <div class="canvas-container">
            <canvas id="canvas" width="800" height="500"></canvas>
        </div>
    </div>

    <script>
        class CreativeCanvas {
            constructor() {
                this.canvas = document.getElementById('canvas');
                this.ctx = this.canvas.getContext('2d');
                this.isDrawing = false;
                this.currentTool = 'brush';
                this.currentColor = '#ff6b6b';
                this.currentSize = 5;
                this.rainbowMode = false;
                this.patternMode = false;
                this.rainbowHue = 0;
                
                this.setupEventListeners();
                this.setupCanvas();
            }

            setupCanvas() {
                this.ctx.lineCap = 'round';
                this.ctx.lineJoin = 'round';
                
                // Make canvas responsive
                const resizeCanvas = () => {
                    const container = this.canvas.parentElement;
                    const maxWidth = container.clientWidth - 40;
                    if (maxWidth < 800) {
                        this.canvas.style.width = maxWidth + 'px';
                        this.canvas.style.height = (maxWidth * 500 / 800) + 'px';
                    }
                };
                
                window.addEventListener('resize', resizeCanvas);
                resizeCanvas();
            }

            setupEventListeners() {
                // Canvas events
                this.canvas.addEventListener('mousedown', this.startDrawing.bind(this));
                this.canvas.addEventListener('mousemove', this.draw.bind(this));
                this.canvas.addEventListener('mouseup', this.stopDrawing.bind(this));
                this.canvas.addEventListener('mouseout', this.stopDrawing.bind(this));

                // Touch events for mobile
                this.canvas.addEventListener('touchstart', this.handleTouch.bind(this));
                this.canvas.addEventListener('touchmove', this.handleTouch.bind(this));
                this.canvas.addEventListener('touchend', this.stopDrawing.bind(this));

                // Tool buttons
                document.getElementById('brushTool').addEventListener('click', () => this.setTool('brush'));
                document.getElementById('eraserTool').addEventListener('click', () => this.setTool('eraser'));
                document.getElementById('sprayTool').addEventListener('click', () => this.setTool('spray'));

                // Size control
                const sizeSlider = document.getElementById('brushSize');
                sizeSlider.addEventListener('input', (e) => {
                    this.currentSize = e.target.value;
                    document.getElementById('sizeDisplay').textContent = e.target.value + 'px';
                });

                // Color controls
                document.getElementById('colorPicker').addEventListener('change', (e) => {
                    this.currentColor = e.target.value;
                    this.rainbowMode = false;
                    this.updateRainbowButton();
                });

                // Preset colors
                document.querySelectorAll('.preset-color').forEach(color => {
                    color.addEventListener('click', (e) => {
                        this.currentColor = e.target.dataset.color;
                        document.getElementById('colorPicker').value = this.currentColor;
                        this.rainbowMode = false;
                        this.updateRainbowButton();
                    });
                });

                // Special effects
                document.getElementById('rainbowMode').addEventListener('click', () => {
                    this.rainbowMode = !this.rainbowMode;
                    this.updateRainbowButton();
                });

                document.getElementById('patternMode').addEventListener('click', () => {
                    this.patternMode = !this.patternMode;
                    this.updatePatternButton();
                });

                // Actions
                document.getElementById('clearCanvas').addEventListener('click', this.clearCanvas.bind(this));
                document.getElementById('saveImage').addEventListener('click', this.saveImage.bind(this));
            }

            handleTouch(e) {
                e.preventDefault();
                const touch = e.touches[0];
                const rect = this.canvas.getBoundingClientRect();
                const scaleX = this.canvas.width / rect.width;
                const scaleY = this.canvas.height / rect.height;
                
                const mouseEvent = new MouseEvent(e.type === 'touchstart' ? 'mousedown' : 'mousemove', {
                    clientX: touch.clientX,
                    clientY: touch.clientY
                });
                
                this.canvas.dispatchEvent(mouseEvent);
            }

            getMousePos(e) {
                const rect = this.canvas.getBoundingClientRect();
                const scaleX = this.canvas.width / rect.width;
                const scaleY = this.canvas.height / rect.height;
                
                return {
                    x: (e.clientX - rect.left) * scaleX,
                    y: (e.clientY - rect.top) * scaleY
                };
            }

            startDrawing(e) {
                this.isDrawing = true;
                const pos = this.getMousePos(e);
                this.lastX = pos.x;
                this.lastY = pos.y;
            }

            draw(e) {
                if (!this.isDrawing) return;

                const pos = this.getMousePos(e);
                
                if (this.rainbowMode) {
                    this.currentColor = `hsl(${this.rainbowHue}, 100%, 50%)`;
                    this.rainbowHue = (this.rainbowHue + 2) % 360;
                }

                this.ctx.globalCompositeOperation = this.currentTool === 'eraser' ? 'destination-out' : 'source-over';
                
                switch (this.currentTool) {
                    case 'brush':
                        this.drawBrush(pos);
                        break;
                    case 'eraser':
                        this.drawBrush(pos);
                        break;
                    case 'spray':
                        this.drawSpray(pos);
                        break;
                }

                this.lastX = pos.x;
                this.lastY = pos.y;
            }

            drawBrush(pos) {
                this.ctx.strokeStyle = this.currentColor;
                this.ctx.lineWidth = this.currentSize;
                
                this.ctx.beginPath();
                this.ctx.moveTo(this.lastX, this.lastY);
                this.ctx.lineTo(pos.x, pos.y);
                this.ctx.stroke();

                if (this.patternMode) {
                    this.drawPattern(pos);
                }
            }

            drawSpray(pos) {
                const density = 20;
                const radius = this.currentSize;
                
                for (let i = 0; i < density; i++) {
                    const offsetX = (Math.random() - 0.5) * radius * 2;
                    const offsetY = (Math.random() - 0.5) * radius * 2;
                    
                    this.ctx.fillStyle = this.currentColor;
                    this.ctx.beginPath();
                    this.ctx.arc(pos.x + offsetX, pos.y + offsetY, 1, 0, Math.PI * 2);
                    this.ctx.fill();
                }
            }

            drawPattern(pos) {
                const patterns = ['circle', 'star', 'heart'];
                const pattern = patterns[Math.floor(Math.random() * patterns.length)];
                
                this.ctx.save();
                this.ctx.translate(pos.x, pos.y);
                this.ctx.fillStyle = this.currentColor;
                
                switch (pattern) {
                    case 'circle':
                        this.ctx.beginPath();
                        this.ctx.arc(0, 0, this.currentSize / 2, 0, Math.PI * 2);
                        this.ctx.fill();
                        break;
                    case 'star':
                        this.drawStar(0, 0, this.currentSize / 2);
                        break;
                    case 'heart':
                        this.drawHeart(0, 0, this.currentSize / 3);
                        break;
                }
                
                this.ctx.restore();
            }

            drawStar(x, y, size) {
                this.ctx.beginPath();
                for (let i = 0; i < 5; i++) {
                    const angle = (i * 144 - 90) * Math.PI / 180;
                    const px = x + size * Math.cos(angle);
                    const py = y + size * Math.sin(angle);
                    if (i === 0) this.ctx.moveTo(px, py);
                    else this.ctx.lineTo(px, py);
                }
                this.ctx.closePath();
                this.ctx.fill();
            }

            drawHeart(x, y, size) {
                this.ctx.beginPath();
                this.ctx.moveTo(x, y + size / 2);
                this.ctx.bezierCurveTo(x, y - size / 2, x - size, y - size / 2, x - size, y);
                this.ctx.bezierCurveTo(x - size, y + size / 2, x, y + size, x, y + size * 1.5);
                this.ctx.bezierCurveTo(x, y + size, x + size, y + size / 2, x + size, y);
                this.ctx.bezierCurveTo(x + size, y - size / 2, x, y - size / 2, x, y + size / 2);
                this.ctx.fill();
            }

            stopDrawing() {
                this.isDrawing = false;
            }

            setTool(tool) {
                this.currentTool = tool;
                document.querySelectorAll('.toolbar button').forEach(btn => btn.classList.remove('active'));
                document.getElementById(tool + 'Tool').classList.add('active');
            }

            updateRainbowButton() {
                const btn = document.getElementById('rainbowMode');
                btn.classList.toggle('active', this.rainbowMode);
            }

            updatePatternButton() {
                const btn = document.getElementById('patternMode');
                btn.classList.toggle('active', this.patternMode);
            }

            clearCanvas() {
                this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
            }

            saveImage() {
                const link = document.createElement('a');
                link.download = 'my-artwork.png';
                link.href = this.canvas.toDataURL();
                link.click();
            }
        }

        // Initialize the app when page loads
        document.addEventListener('DOMContentLoaded', () => {
            new CreativeCanvas();
        });
    </script>
</body>
</html>
EOF

echo "✅ File created successfully!"
echo "📍 Location: ~/Desktop/creative-canvas.html"
echo ""
echo "🚀 Opening in your default browser..."
open ~/Desktop/creative-canvas.html

echo ""
echo "🎨 Your Creative Canvas should now be open!"
echo "If it doesn't open automatically, go to your Desktop and double-click 'creative-canvas.html'"