using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application
{
    public interface IUseCaselogger
    {
        void Log(IUseCase useCase, IApplicationActor actor, object useCaseData);
    }
}
