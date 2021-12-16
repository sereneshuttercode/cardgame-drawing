function main() {
    
    var mainBody = document.getElementById("mainbody");
    
    var canvas = document.createElement("canvas");
    mainBody.appendChild(canvas);
    canvas.width = "600";
    canvas.height = "600";
    
    var ctx = canvas.getContext("2d");
    
    
    
    // Draw box path
    ctx.fillStyle = "#FFFFFF";
    ctx.beginPath();
    ctx.moveTo(10,10);
    ctx.lineTo(10,522);
    ctx.lineTo(522,522);
    ctx.lineTo(522,10);
    ctx.closePath();
    ctx.stroke();
    ctx.fill();
    
    // Draw the other path
    ctx.fillStyle = "#000000";
    ctx.beginPath();
    ctx.moveTo(119.436,36);
    ctx.bezierCurveTo(-16.126+119.436,0+36,-29.2+119.436,17.237+36,-29.2+119.436,38.5+36);
    ctx.lineTo(-29.2+119.436,38.5+36+362.998);
    ctx.bezierCurveTo(-29.2+119.436,21.263+362.998,13.074-29.2+119.436,38.5+362.998,119.436,38.5+362.998);
    ctx.lineTo(29.2-29.2+119.436+275.298,38.5+362.998);
    ctx.bezierCurveTo(0,21.263,13.074,38.5,29.2,38.5);
    ctx.lineTo();
    ctx.bezierCurveTo();
    
    
    //ctx.closePath();
    ctx.stroke();
    ctx.fill();
    
    
    
    
    
    
}
