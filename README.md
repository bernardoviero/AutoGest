# Learning Laravel

Projeto Laravel - Estrutura de pastas (Clean Architecture adaptada)

```text
app/
├── Domain/                  # Lógica de negócio pura (independente de framework)
│   ├── Entities/            # Entidades / Models no estilo DDD
│   │                        # Exemplos: Appointment, Service, Client, Vehicle
│   ├── ValueObjects/        # Objetos de valor imutáveis
│   │                        # Exemplos: Money (para preços), Duration (para tempos)
│   ├── Repositories/        # Interfaces de repositórios (contratos)
│   │                        # Exemplo: AppointmentRepositoryInterface
│   └── Exceptions/          # Exceções específicas do domínio
│                            # Exemplo: ScheduleConflictException
│
├── Application/             # Casos de uso / Orquestração da lógica de negócio
│   ├── Services/            # Serviços de aplicação (use cases)
│   │                        # Exemplo: AppointmentService com bookAppointment()
│   ├── DTOs/                # Data Transfer Objects (estruturas para transferência de dados)
│   │                        # Exemplo: CreateAppointmentDTO
│   └── Jobs/                # Jobs para filas (queues)
│                            # Exemplo: SendReminderJob
│
├── Infrastructure/          # Implementações concretas (adaptações ao framework/DB/etc)
│   ├── Persistence/         # Repositórios concretos (implementam as interfaces do Domain)
│   │                        # Exemplo: EloquentAppointmentRepository
│   ├── Notifications/       # Implementações de notificações
│   │                        # Exemplo: InternalNotificationService
│   └── Queues/              # Configurações relacionadas a filas
│
├── Http/                    # Camada de apresentação (API / Controllers)
│   ├── Controllers/         # Controllers da aplicação
│   │                        # Exemplo: AppointmentController
│   ├── Requests/            # Form Requests para validação de entrada
│   │                        # Exemplo: CreateAppointmentRequest
│   ├── Resources/           # API Resources (formatação de respostas JSON)
│   │                        # Exemplo: AppointmentResource
│   └── Middleware/          # Middlewares customizados
│                            # Exemplo: CheckScheduleAvailability
│
├── Routes/                  # Definição de rotas (separadas por tipo)
│                            # api.php, web.php, etc.
│
├── Tests/                   # Testes unitários e de feature
│
├── Config/                  # Arquivos de configuração padrão do Laravel
│
├── Database/                # Banco de dados relacionado
│   ├── migrations/          # Migrations
│   ├── seeders/             # Seeders
│   └── factories/           # Factories
│
└── bootstrap/               # Arquivos de inicialização do framework (padrão Laravel)
