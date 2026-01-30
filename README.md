## Learning Laravel

Laravel project - test;

app/
├── Domain/                  # Lógica de negócio pura (entidades, value objects, repositories interfaces)
│   ├── Entities/            # Models como entidades DDD (ex: Appointment, Service, Client, Vehicle)
│   ├── ValueObjects/        # Objetos imutáveis (ex: Money para preços, Duration para tempos)
│   ├── Repositories/        # Interfaces (ex: AppointmentRepositoryInterface)
│   └── Exceptions/          # Exceções de domínio (ex: ScheduleConflictException)
├── Application/             # Serviços e use cases (orquestra domain)
│   ├── Services/            # Serviços (ex: AppointmentService com métodos como bookAppointment())
│   ├── DTOs/                # Data Transfer Objects (ex: CreateAppointmentDTO)
│   └── Jobs/                # Jobs para queues (ex: SendReminderJob)
├── Infrastructure/          # Implementações concretas
│   ├── Persistence/         # Repositories concretos (ex: EloquentAppointmentRepository implements AppointmentRepositoryInterface)
│   ├── Notifications/       # Implementações de notificações (ex: InternalNotificationService)
│   └── Queues/              # Configs para queues
├── Http/                    # Presentation layer (API)
│   ├── Controllers/         # Controllers (ex: AppointmentController)
│   ├── Requests/            # FormRequests para validação (ex: CreateAppointmentRequest)
│   ├── Resources/           # API Resources (ex: AppointmentResource para responses JSON)
│   └── Middleware/          # Custom middleware (ex: CheckScheduleAvailability)
├── Routes/                  # Rotas separadas (api.php, web.php se necessário)
├── Tests/                   # Unit/Feature tests
├── Config/                  # Configs padrão Laravel
├── Database/                # Migrations, Seeders, Factories
└── bootstrap/               # Padrão
