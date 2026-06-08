<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Belle & Carrie Yoga</title>
    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: Arial, sans-serif;
        }

        header{
            background:#f5f0e8;
            padding:20px 10%;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        nav a{
            text-decoration:none;
            color:#333;
            margin:0 15px;
            font-weight:bold;
        }

        .hero{
            height:500px;
            background:url('https://images.unsplash.com/photo-1506126613408-eca07ce68773')
                       center/cover;
            display:flex;
            align-items:center;
            justify-content:center;
            color:white;
            text-align:center;
        }

        .hero h1{
            font-size:55px;
        }

        .hero p{
            font-size:22px;
            margin-top:10px;
        }

        .section{
            padding:60px 10%;
            text-align:center;
        }

        .cards{
            display:flex;
            gap:20px;
            justify-content:center;
            flex-wrap:wrap;
        }

        .card{
            width:300px;
            padding:25px;
            background:#f9f9f9;
            border-radius:10px;
            box-shadow:0 2px 8px rgba(0,0,0,0.1);
        }

        footer{
            background:#333;
            color:white;
            text-align:center;
            padding:20px;
        }

        .btn{
            display:inline-block;
            margin-top:20px;
            padding:12px 25px;
            background:#6d9c6d;
            color:white;
            text-decoration:none;
            border-radius:5px;
        }
    </style>
</head>
<body>

<header>
    <h2>Yoga Wellness</h2>
    <nav>
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Classes</a>
        <a href="#">Instructors</a>
        <a href="#">Contact</a>
    </nav>
</header>

<section class="hero">
    <div>
        <h1>Yoga</h1>
        <p>For Better Health & Flexibility</p>
        <a href="#" class="btn">Join Today</a>
    </div>
</section>

<section class="section">
    <h2>Our Classes</h2>
    <br>
    <div class="cards">
        <div class="card">
            <h3>Hatha Yoga</h3>
            <p>Improve flexibility and balance.</p>
        </div>

        <div class="card">
            <h3>Vinyasa Yoga</h3>
            <p>Dynamic flow and breathing exercises.</p>
        </div>

        <div class="card">
            <h3>Meditation</h3>
            <p>Relax your mind and body.</p>
        </div>
    </div>
</section>

<section class="section" style="background:#f5f0e8;">
    <h2>Why Choose Us?</h2>
    <br>
    <p>
        Experienced instructors, personalized programs,
        and a peaceful environment for your wellness journey.
    </p>
</section>

<footer>
    <p>© <%= java.time.Year.now() %> Yoga Wellness Studio</p>
</footer>

</body>
</html>