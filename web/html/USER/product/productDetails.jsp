<%-- 
    Document   : productDetails
    Created on : Apr 14, 2025, 3:46:52 PM
    Author     : Madelyn Yap
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Premium Drink Bottle - Flowers & Saints</title>
  <!-- Tailwind CSS CDN for development purposes -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Lucide Icons -->
  <script src="https://unpkg.com/lucide@latest"></script>
  <style>
    /* Base styles */
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
      margin: 0;
      padding: 0;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      background-color: white;
    }

    /* Hide scrollbar for Chrome, Safari and Opera */
    ::-webkit-scrollbar {
      display: none;
    }

    /* Hide scrollbar for IE, Edge and Firefox */
    * {
      -ms-overflow-style: none; /* IE and Edge */
      scrollbar-width: none; /* Firefox */
    }

    /* Header styles */
    header {
      padding: 1.5rem 0;
      border-bottom: 1px solid #eaeaea;
    }

    .container {
      width: 80%;
      margin: 0 auto;
    }

    /* Product image carousel */
    .carousel {
      position: relative;
      width: 100%;
    }

    .carousel-item {
      display: none;
      width: 100%;
      aspect-ratio: 1/1;
      border-radius: 1rem;
      overflow: hidden;
    }

    .carousel-item.active {
      display: block;
    }

    .carousel-item img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s ease;
    }

    .carousel-item:hover img {
      transform: scale(1.05);
    }

    .carousel-nav {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background-color: rgba(255, 255, 255, 0.8);
      border: none;
      width: 3rem;
      height: 3rem;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      z-index: 10;
    }

    .carousel-nav:hover {
      background-color: white;
    }

    .carousel-prev {
      left: 0.5rem;
    }

    .carousel-next {
      right: 0.5rem;
    }

    .thumbnail-container {
      display: flex;
      gap: 1rem;
      margin-top: 1.5rem;
      justify-content: center;
    }

    .thumbnail {
      width: 4rem;
      height: 4rem;
      border-radius: 0.5rem;
      overflow: hidden;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .thumbnail:hover {
      box-shadow: 0 0 0 1px #eaeaea;
    }

    .thumbnail.active {
      box-shadow: 0 0 0 2px black;
    }

    .thumbnail img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    /* Size and color selectors */
    .size-selector, .color-selector {
      display: flex;
      flex-wrap: wrap;
      gap: 0.75rem;
      margin-top: 0.5rem;
    }

    .size-btn {
      padding: 0.5rem 1rem;
      border-radius: 9999px;
      border: 2px solid #eaeaea;
      font-size: 0.875rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .size-btn:hover {
      border-color: #d1d1d1;
    }

    .size-btn.active {
      background-color: black;
      color: white;
      border-color: black;
    }

    .color-btn {
      width: 3rem;
      height: 3rem;
      border-radius: 50%;
      border: 2px solid #eaeaea;
      cursor: pointer;
      transition: all 0.2s ease;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .color-btn:hover {
      box-shadow: 0 0 0 1px #eaeaea;
    }

    .color-btn.active {
      box-shadow: 0 0 0 2px black, 0 0 0 4px white;
    }

    /* Quantity selector */
    .quantity-selector {
      display: flex;
      align-items: center;
      border: 1px solid #eaeaea;
      border-radius: 9999px;
    }

    .quantity-btn {
      background: none;
      border: none;
      width: 2.5rem;
      height: 2.5rem;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .quantity-display {
      width: 3rem;
      text-align: center;
    }

    /* Tabs */
    .tabs {
      margin-top: 4rem;
    }

    .tab-list {
      display: flex;
      border-bottom: 1px solid #eaeaea;
    }

    .tab-trigger {
      padding: 0.75rem 1.5rem;
      font-size: 1.125rem;
      cursor: pointer;
      border-bottom: 2px solid transparent;
    }

    .tab-trigger.active {
      border-bottom-color: black;
    }

    .tab-content {
      display: none;
      padding: 1.5rem 0;
    }

    .tab-content.active {
      display: block;
    }

    /* Related products */
    .related-products {
      margin-top: 4rem;
    }

    .product-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 1.5rem;
    }

    @media (min-width: 768px) {
      .product-grid {
        grid-template-columns: repeat(4, 1fr);
      }
    }

    .product-card {
      cursor: pointer;
    }

    .product-image {
      position: relative;
      aspect-ratio: 1/1;
      border-radius: 0.5rem;
      overflow: hidden;
      margin-bottom: 0.75rem;
    }

    .product-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s ease;
    }

    .product-card:hover .product-image img {
      transform: scale(1.05);
    }

    /* Buttons */
    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      padding: 0.75rem 1.5rem;
      border-radius: 0.5rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .btn-primary {
      background-color: black;
      color: white;
      border: none;
    }

    .btn-primary:hover {
      background-color: #333;
    }

    .btn-outline {
      background-color: transparent;
      border: 1px solid #eaeaea;
    }

    .btn-outline:hover {
      border-color: #d1d1d1;
    }

    .btn-icon {
      padding: 0.75rem;
    }

    /* Responsive layout */
    .product-container {
      display: flex;
      flex-direction: column;
      gap: 3rem;
      margin: 3rem auto;
    }

    @media (min-width: 1024px) {
      .product-container {
        flex-direction: row;
      }

      .product-images {
        width: 50%;
        position: sticky;
        top: 6rem;
        align-self: flex-start;
      }

      .product-details {
        width: 50%;
      }
    }

    /* Star rating */
    .star-rating {
      display: flex;
    }

    .star {
      color: #f59e0b;
    }

    /* Social sharing */
    .social-share {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    .social-btn {
      color: #888;
      transition: color 0.2s ease;
    }

    .social-btn:hover {
      color: #555;
    }

    /* Reviews */
    .review {
      display: flex;
      gap: 1rem;
      margin-bottom: 1rem;
    }

    .review-avatar {
      width: 3rem;
      height: 3rem;
      border-radius: 50%;
      background-color: #eaeaea;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.25rem;
      font-weight: 600;
      color: #666;
    }
  </style>
</head>
<body>
  <!-- Header -->
  <header>
    <div class="container flex items-center justify-between">
      <!-- Logo -->
      <a href="#" class="text-2xl font-bold tracking-tight">Flowers & Saints</a>

      <!-- Navigation -->
      <nav class="hidden md:flex items-center space-x-8">
        <a href="#" class="text-base font-medium text-black hover:text-gray-600 transition-colors">Home</a>
        <a href="#" class="text-base font-medium text-gray-500 hover:text-gray-600 transition-colors">Products</a>
        <a href="#" class="text-base font-medium text-gray-500 hover:text-gray-600 transition-colors">About</a>
        <a href="#" class="text-base font-medium text-gray-500 hover:text-gray-600 transition-colors">Contact</a>
      </nav>

      <!-- Actions -->
      <div class="flex items-center space-x-4">
        <button class="btn btn-icon btn-outline">
          <i data-lucide="shopping-bag" class="w-6 h-6"></i>
        </button>
        <button class="btn btn-primary">Login/Register</button>
        <button class="btn btn-icon btn-outline md:hidden">
          <i data-lucide="menu" class="w-6 h-6"></i>
        </button>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <main class="flex-grow">
    <div class="container">
      <div class="product-container">
        <!-- Product Images -->
        <div class="product-images">
          <div class="carousel">
            <div class="carousel-item active">
              <img src="https://placehold.co/600x600?text=Bottle1" alt="Premium Drink Bottle">
            </div>
            <div class="carousel-item">
              <img src="https://placehold.co/600x600?text=Bottle2" alt="Premium Drink Bottle">
            </div>
            <div class="carousel-item">
              <img src="https://placehold.co/600x600?text=Bottle3" alt="Premium Drink Bottle">
            </div>
            <div class="carousel-item">
              <img src="https://placehold.co/600x600?text=Bottle4" alt="Premium Drink Bottle">
            </div>
            <button class="carousel-nav carousel-prev">
              <i data-lucide="chevron-left" class="w-6 h-6"></i>
            </button>
            <button class="carousel-nav carousel-next">
              <i data-lucide="chevron-right" class="w-6 h-6"></i>
            </button>
          </div>

          <div class="thumbnail-container">
            <div class="thumbnail active" data-index="0">
              <img src="https://placehold.co/200x200?text=Bottle1" alt="Thumbnail 1">
            </div>
            <div class="thumbnail" data-index="1">
              <img src="https://placehold.co/200x200?text=Bottle2" alt="Thumbnail 2">
            </div>
            <div class="thumbnail" data-index="2">
              <img src="https://placehold.co/200x200?text=Bottle3" alt="Thumbnail 3">
            </div>
            <div class="thumbnail" data-index="3">
              <img src="https://placehold.co/200x200?text=Bottle4" alt="Thumbnail 4">
            </div>
          </div>
        </div>

        <%@ include file="../home/footer.jsp" %>
    </body>
</html>
