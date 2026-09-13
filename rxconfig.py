import reflex as rx

config = rx.Config(
    app_name="myreflex_app",  # replace with your actual app package name
    api_url="https://myreflex-app.onrender.com",
    cors_allowed_origins=[
        "https://myreflex-app.onrender.com",
        "http://localhost:3000",
    ],
)